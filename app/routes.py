from flask import Blueprint, render_template, request, redirect, url_for
from .models import Note
from . import db

main = Blueprint('main', __name__)

# Home Page - list all notes
@main.route('/')
def index():
    notes = Note.query.all()
    return render_template('index.html', notes=notes)

# Add a new note
@main.route('/add', methods=['POST'])
def add_note():
    title = request.form.get('title')
    content = request.form.get('content')
    
    if title and content:
        new_note = Note(title=title, content=content)
        db.session.add(new_note)
        db.session.commit()
    return redirect(url_for('main.index'))

# Delete a note
@main.route('/delete/<int:note_id>')
def delete_note(note_id):
    note = Note.query.get(note_id)
    if note:
        db.session.delete(note)
        db.session.commit()
    return redirect(url_for('main.index'))
