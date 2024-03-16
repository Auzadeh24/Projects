from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/register', methods=['POST'])
def register_user():
  
    return jsonify({'message': 'User registered successfully'})

@app.route('/login', methods=['POST'])
def login_user():
    
    return jsonify({'message': 'User logged in successfully'})

@app.route('/reset-password', methods=['POST'])
def reset_password():
    
    return jsonify({'message': 'Password reset successful'})

if __name__ == '__main__':
    app.run(debug=True)
