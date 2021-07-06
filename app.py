from flask import Flask, url_for, session, request, redirect, render_template, flash
import mysql.connector

flag = 0

app = Flask(__name__)
app.secret_key = "hello"


@app.route("/", methods=["POST", "GET"])
def login():
	global flag
	if request.method == "POST":
	 	user = request.form["nm"]
	 	password = request.form["pwd"]

	 	if user == "admin" and password == "root":
	 		
	 		flag = 1
	 		flash("Welcome to Central Jail!")
	 		return redirect(url_for("home"))
	 	else:
	 		flash("Wrong credentials!")
	 		return render_template("login.html")
	else:
	 	return render_template("login.html")


@app.route("/home", methods=["POST", "GET"])
def home():
	global flag
	if flag == 1:
			
		db = mysql.connector.connect(
		host="localhost",
		user="root",
		passwd="root",
		database="prison_management"
		)

		mycursor = db.cursor()

		query = "SELECT pr.prisoner_id, name, ph_no, native_city, parole, cell, warden_id, block_id from prisoner pr, new_details nd where pr.prisoner_id=nd.prisoner_id;"
		

		mycursor.execute(query)
		rows = mycursor.fetchall()

		prisoner = []
		for x in rows:
			prisoner.append(x)
			
		return render_template("home.html", prisoner=prisoner)
		
	else:
		return redirect(url_for("login"))
	



@app.route("/addprisoner", methods=["POST", "GET"])
def addprisoner():
	global flag
	if request.method == "POST":
		try:
			prisoner_name = ""
			native_city = ""
			phone_no = 0
			parole = 0
			prisoner_name = request.form["name"]
			native_city = request.form["city"]
			phone_no = int(request.form["phone"])
			parole = int(request.form["parole"])

			db = mysql.connector.connect(
			host="localhost",
			user="root",
			passwd="root",
			database="prison_management"
			)

			mycursor = db.cursor()

			query = '''INSERT INTO prisoner(name, ph_no, native_city, parole) VALUES(%s, %s, %s, %s)'''
			val =  (prisoner_name, phone_no, native_city, parole)

			mycursor.execute(query,val)

			db.commit()

			flash("Prisoner added successfully!")

			return render_template("addPrisoner.html")
		except ValueError:
			flash("Wrong entry!")
			return render_template("addPrisoner.html")
	else:
		if flag == 1:
			return render_template("addPrisoner.html")
		else:
			return redirect(url_for("login")) 
		

@app.route("/visiting", methods=["POST", "GET"])
def visit():
	if request.method == "POST":
		try:
			visitor = ""
			phone = 0
			prisoner = ""
			cell = 0
			relation = ""
			purpose = ""
			visitor = request.form["v_name"]
			phone = int(request.form["phone"])
			cell = request.form["cell"]
			prisoner = request.form["p_name"]
			relation = request.form["rel"]
			purpose = request.form["purpose"]

			db = mysql.connector.connect(
			host="localhost",
			user="root",
			passwd="root",
			database="prison_management"
			)

			mycursor = db.cursor()



			query2 = "INSERT INTO visitor(visitor, ph_no, cell, prisoner, relation, purpose) VALUES (%s, %s, %s, %s, %s, %s)"
			val2 =  (visitor, phone, cell, prisoner, relation, purpose)

			mycursor.execute(query2,val2)
			db.commit()

			flash("Visitor added successfully!")

			return render_template("visiting.html")


		except ValueError:
			flash("Wrong entry!")
			return render_template("visiting.html")

	else:
		if flag == 1:
			return render_template("visiting.html")
		else:
			return redirect(url_for("home"))


@app.route("/appointments", methods=["POST","GET"])
def appointment():
	global flag
	if flag == 1:
			
		db = mysql.connector.connect(
		host="localhost",
		user="root",
		passwd="root",
		database="prison_management"
		)

		mycursor = db.cursor()

		query = "SELECT * FROM visitor"
		
		mycursor.execute(query)
		rows = mycursor.fetchall()  

		visitor = []
		for x in rows:
			visitor.append(x)
			
		return render_template("appointments.html", visitor=visitor)
		
	else:
		return redirect(url_for("login"))

@app.route("/logout")
def logout():
	global flag
	if flag == 0:
		flash("You are already logged out! You need to login!", "info")
		return redirect(url_for("login"))
	else:
		flag = 0
		session.pop("user", None)
		flash("You are logged out!", "info")
		return redirect(url_for("login"))
if __name__ == "__main__":
    app.run(debug=True)
