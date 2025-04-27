from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)

    # Basic configuration
    app.config['SECRET_KEY'] = 'your-secret-key'  # later can load from environment variables
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///notes.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Initialize database
    db.init_app(app)

    # Import routes
    from .routes import main
    app.register_blueprint(main)

    return app
