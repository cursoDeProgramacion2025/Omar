from flask import Flask, render_template

app = Flask(__name__)

# Página de inicio
@app.route('/')
def inicio():
    return render_template('inicio.html')

# Página nosotros
@app.route('/nosotros')
def nosotros():
    return render_template('nosotros.html')

# Página contacto
@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8000)
