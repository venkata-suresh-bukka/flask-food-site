from flask import Flask, render_template, request, redirect, url_for, session
import mysql.connector
import os
from flask import jsonify


app = Flask(__name__)
app.secret_key = os.urandom(24)  

# Establish MySQL database connection
conn = mysql.connector.connect(
    host='34.136.39.89',
    user='root',
    password='admin123',
    database='books'
)
print("Connected to MySQL database successfully")



@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        cursor = conn.cursor(dictionary=True)
        
        try:
            # Check if the user exists in the database
            cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
            user = cursor.fetchone()
            print(user)
            
            if user and password_is_correct(password, user['password']):
                # Store user's session information
                session['user_id'] = user['id']  # Assuming you have an 'id' column in the users table
                session['email'] = user['email']
                return redirect(url_for('home'))
            else:
                msg = "Invalid email or password"
                return render_template('login.html', msg=msg)
        except mysql.connector.Error as e:
            msg = "Error: Unable to login. Please try again later."
            return render_template('login.html', msg=msg)
        finally:
            cursor.close()
    
    return render_template('login.html')

def password_is_correct(plain_password, hashed_password):
    return plain_password == hashed_password


@app.route('/home')
def home():
    if 'user_id' in session:
        # User is authenticated, render home.html
        return render_template('LoginFoodSite.html')
    else:
        # User is not authenticated, render login.html
        return render_template('login.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        
        cursor = conn.cursor()
        
        try:
            # Check if the user already exists in the database
            cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
            existing_user = cursor.fetchone()
            
            if existing_user:
                msg = "User with this email already exists"
                return render_template('signup.html', msg=msg)
            else:
                # Hash the password before storing it in the database
                hashed_password = hash_password(password)
                insert_query = "INSERT INTO users (username,email, password) VALUES (%s, %s, %s)"
                cursor.execute(insert_query, (username, email, hashed_password))
                conn.commit()
                msg = "Signup successful! Please log in."
                return render_template('login.html', msg=msg)
        except mysql.connector.Error as e:
            conn.rollback()
            msg = "Error: Unable to signup. Please try again later."
            return render_template('signup.html', msg=msg)
        finally:
            cursor.close()
    
    return render_template('signup.html')

def hash_password(password):
    # You should use a secure hashing algorithm here, like bcrypt
    # For this example, we'll use a simple demonstration
    return password 

@app.route('/')
def default_route():
    return render_template('FoodSite.html') 


@app.route('/logout')
def logout():
    # Clear the user's session information to log them out
    session.clear()
    return redirect(url_for('login'))



@app.route('/order', methods=['POST'])
def order():
    if request.method == 'POST':
        try:
            name = request.form['name']
            email = request.form['email']
            phone_number = request.form['number']
            quantity = int(request.form['quantity'])
            item_name = request.form['item_name']

            cursor = conn.cursor()
            insert_query = "INSERT INTO order_details (name, email, phone_number, quantity, item_name) VALUES (%s, %s, %s, %s, %s)"
            cursor.execute(insert_query, (name, email, phone_number, quantity, item_name))
            conn.commit()
            cursor.close()

            return jsonify(success=True)
        except mysql.connector.Error as e:
            conn.rollback()
            return jsonify(success=False, error=str(e))
        
ORDERS_PER_PAGE = 10

@app.route('/order_details')
def orders():
    if 'user_id' in session:
        user_email = session['email']  # Get the user's email from the session
        
        cursor = conn.cursor(dictionary=True)
        try:
            # Get the page number from the request URL's query parameters
            page = request.args.get('page', default=1, type=int)
            
            # Calculate the offset for the SQL query based on the page number and orders per page
            offset = (page - 1) * ORDERS_PER_PAGE
            
            # Fetch orders with pagination for the logged-in user
            cursor.execute("SELECT * FROM order_details WHERE email = %s LIMIT %s OFFSET %s", (user_email, ORDERS_PER_PAGE, offset))
            orders = cursor.fetchall()
            
            # Count the total number of orders for pagination
            cursor.execute("SELECT COUNT(*) as count FROM order_details WHERE email = %s", (user_email,))
            total_orders = cursor.fetchone()['count']
            
            # Calculate the total number of pages
            total_pages = (total_orders + ORDERS_PER_PAGE - 1) // ORDERS_PER_PAGE
            
            return render_template('order_details.html', orders=orders, page=page, total_pages=total_pages)
        except mysql.connector.Error as e:
            # Handle error if database query fails
            return render_template('error.html', error=str(e))
        finally:
            cursor.close()
    else:
        # Redirect to login page if user is not authenticated
        return redirect(url_for('login'))
    


if __name__ == "__main__":
    app.run(debug=True)
    conn.close()
