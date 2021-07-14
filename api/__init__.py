from flask import Flask, jsonify


def create_app() -> Flask:
    """Flask app factory pattern.

    Returns:
        Flask: flask app object.
    """

    app = Flask(__name__)

    @app.route("/api/test", methods=["GET"])
    def sample_route():
        return jsonify({"message": "This is a sample route"})

    return app
