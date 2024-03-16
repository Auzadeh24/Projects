from flask import Flask, jsonify, request

app = Flask(__name__)

products = []

@app.route('/products', methods=['GET'])
def get_products():
    return jsonify({'products': products})

@app.route('/products', methods=['POST'])
def create_product():
    data = request.get_json()
    products.append(data)
    return jsonify({'message': 'Product created successfully'})

if __name__ == '__main__':
    app.run(debug=True)

