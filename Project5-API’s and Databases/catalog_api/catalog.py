from flask import Flask, jsonify, request

app = Flask(__name__)
products = [
    {
        "id": 1,
        "name": "Product 1",
        "description": "Description for Product 1",
        "price": 10.99,
    },
    {
        "id": 2,
        "name": "Product 2",
        "description": "Description for Product 2",
        "price": 20.99,
    },
    {
        "id": 3,
        "name": "Product 3",
        "description": "Description for Product 3",
        "price": 30.99,
    },
]


@app.route("/products", methods=["GET"])
def get_products():
    return jsonify(products)


@app.route("/products/<int:product_id>", methods=["GET"])
def get_product(product_id):
    product = next((p for p in products if p["id"] == product_id), None)
    if product:
        return jsonify(product)
    else:
        return jsonify({"message": "Product not found"}), 404


@app.route("/products", methods=["POST"])
def create_product():
    data = request.get_json()
    new_product = {
        "id": len(products) + 1,
        "name": data.get("name"),
        "description": data.get("description"),
        "price": data.get("price"),
    }
    products.append(new_product)
    return jsonify(new_product), 201


if __name__ == "__main__":
    app.run(debug=True)
