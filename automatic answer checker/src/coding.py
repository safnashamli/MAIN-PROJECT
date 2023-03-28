from flask import *
app=Flask(__name__)
from src.dbconnectionnew import *
app.secret_key="asdf"
@app.route('/')
def login():
    return render_template("index login.html")


@app.route('/login_code',methods=['get','post'])
def login_code():
    username=request.form['textfield']
    password=request.form['textfield2']

    qry="select *from login where username=%s and password=%s"

    val=(username,password)
    res=selectone(qry,val)

    if res is None:

        return '''<script alert("invalid");window.location="/"</script>'''

    elif res['type']=='admin':
        return redirect('/adminhome')
    elif res['type']=='staff':
        session['lid']=res['id']
        return redirect('/staffhome')
    elif res['type']=='student':
        return redirect('/studenthome')
    else:
        return '''<script alert("invalid");window.location="/"</script>'''

@app.route('/addstaff2',methods=['get','post'])
def addstaff2():
    Fname=request.form['textfield6']
    Lname=request.form['textfield2']
    place=request.form['textfield3']
    pin=request.form['textfield']
    email=request.form['textfield4']
    department=request.form['select']
    housename=request.form['textfield9']
    post=request.form['textfield10']
    phone=request.form['textfield5']

    username=request.form['textfield7']
    password=request.form['textfield8']
    qry="insert into login values(Null,%s,%s,'staff details')"
    val=(username,password)
    id=iud(qry,val)
    qry1="insert into `staff details` values(%s,Null,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val1=(str(id),Fname,Lname,place,pin,email,department,housename,post,phone)
    iud(qry1,val1)
    return '''<script alert("invalid");window.location="managestaff"</script>'''

@app.route('/addsub2',methods=['get','post'])
def addsub2():
     subject=request.form['textfield']
     courses= request.form['select']
     qry1="insert into `mange_subject` values(Null,%s,%s)"
     val1=(courses,subject)
     iud(qry1,val1)
     return '''<script alert("invalid");window.location="mange_subject"</script>'''

@app.route('/addallo2',methods=['get','post'])
def addallo2():
     subj=request.form['select']
     staff= request.form['select2']
     qry1="insert into `mange_allosub` values(Null,%s,%s)"
     val1=(subj,staff)
     iud(qry1,val1)
     return '''<script alert("invalid");window.location="mange_allosub"</script>'''

@app.route('/addcourse2',methods=['get','post'])
def addcourse2():
     course=request.form['textfield']
     depart=request.form['select']
     qry1="insert into `courses` values(Null,%s,%s)"
     val1=(depart,course)
     iud(qry1,val1)
     return '''<script alert("invalid");window.location="courses"</script>'''

@app.route('/addshedu2',methods=['get','post'])
def addshedu2():
     examname=request.form['select']
     date=request.form['textfield']
     time=request.form['textfield2']
     qry1="insert into `exam shedule` values(Null,%s,%s,%s)"
     val1=(examname,date,time)
     iud(qry1,val1)
     return '''<script alert("invalid");window.location="exam shedule"</script>'''

@app.route('/addnot2',methods=['get','post'])
def addnot2():
     notf=request.form['textfield']
     dat = request.form['textfield2']
     tim = request.form['textfield3']
     qry1="insert into `notification` values(Null,%s,%s,%s)"
     val1=(notf,dat,tim)
     iud(qry1,val1)
     return '''<script alert("invalid");window.location="notification"</script>'''

@app.route("/deletestaff")
def deletestaff():
    id=request.args.get('id')
    q="DELETE FROM `staff details` WHERE `lid`=%s"
    iud(q,id)
    qr="DELETE FROM `login` WHERE `id`=%s"
    iud(qr,id)
    return '''<script alert("deleted");window.location="staff details"</script>'''
@app.route("/deletesubje")
def deletesubje():
    id=request.args.get('id')
    q="DELETE FROM `mange_subject` WHERE `sub_id`=%s"
    iud(q,id)
    return '''<script alert("deleted");window.location="mange_subject"</script>'''

@app.route("/deletesuballo")
def deletesuballo():
    id=request.args.get('id')
    q="DELETE FROM `mange_allosub` WHERE `allo_id`=%s"
    iud(q,id)
    return '''<script alert("deleted");window.location="mange_allosub"</script>'''

@app.route("/deletecourse")
def deletecourse():
    id=request.args.get('id')
    q="DELETE FROM `courses` WHERE `course_id`=%s"
    iud(q,id)
    return '''<script alert("deleted");window.location="courses"</script>'''



@app.route("/deleteshedule")
def deleteshedule():
    id=request.args.get('id')
    q="DELETE FROM `exam shedule` WHERE `schedule_id`=%s"
    iud(q,id)
    return '''<script alert("deleted");window.location="exam shedule"</script>'''

@app.route("/deletenot")
def deletenot():
    id=request.args.get('id')
    q="DELETE FROM `notification` WHERE `not_id`=%s"
    iud(q,id)
    return '''<script alert("deleted");window.location="notification"</script>'''





@app.route('/addcourse',methods=['get','post'])
def addcourse():

    qry="SELECT * FROM `department`"
    res=selectall(qry)
    return render_template("add course.html",val=res)

@app.route('/managecourse',methods=['get','post'])
def managecourse():
    qry = "SELECT * FROM `courses` JOIN `department` ON `courses`.dep_id =`department`.dep_id"
    res = selectall(qry)
    return render_template("manage course.html",val=res)

@app.route('/allocatesubject',methods=['get','post'])
def allocatesubject():
    qry="SELECT * FROM `mange_subject`"
    res1=selectall(qry)
    qry="SELECT * FROM `staff details`"
    res=selectall(qry)
    return render_template("allocate subject.html",val=res,val1=res1)






@app.route('/manageallosubject',methods=['get','post'])
def manageallosubject ():
    qry = "SELECT * FROM `mange_allosub` JOIN `staff details` ON `mange_allosub`.staff_id =`mange_allosub`.staff_id  JOIN `mange_subject` ON `mange_allosub`.sub_id"
    res = selectall(qry)
    return render_template("manage allo sub.html",val=res)

@app.route('/managestaff',methods=['get','post'])
def managestaff ():
    qry="SELECT * FROM `staff details` JOIN `department` ON `staff details`.dep_id =`department`.dep_id"
    res=selectall(qry)
    return render_template("manage staff.html",val=res)

@app.route('/addstaff',methods=['get','post'])
def addstaff ():
    qry="SELECT * FROM department"
    res=selectall(qry)
    return render_template("add staff.html",val=res)

@app.route('/manageshedule',methods=['get','post'])
def manageshedule ():
    qry = "SELECT * FROM `exam shedule` JOIN `manage exam` ON `exam shedule`.exam_id =`manage exam`.exam_id"
    res = selectall(qry)
    return render_template("mange exam shedule.html",val=res)

@app.route('/addshedule',methods=['get','post'])
def addshedule ():
    qry="SELECT * FROM `manage exam`"
    res=selectall(qry)
    return render_template("Add exam shedule.html",val=res)

@app.route('/notification',methods=['get','post'])
def notification ():
    qry="SELECT * FROM `notification`"
    res=selectall(qry)
    return render_template("manage notification.html",val=res)

@app.route('/addnotification',methods=['get','post'])
def addnotification ():
    return render_template("add notification.html")

@app.route('/managestudent',methods=['get','post'])
def managestudent ():
    qry = "SELECT * FROM `student` JOIN `courses` ON `student`.course_id =`courses`.dep_id"
    res = selectall(qry)
    return render_template("manage students.html",val=res)

@app.route('/addstudent',methods=['get','post'])
def addstudent ():
    qry="SELECT * FROM notes"
    return render_template("add students.html")

@app.route('/testtable',methods=['get','post'])
def testtable ():
    return render_template("test table.html")



@app.route('/viewsubject')
def viewsubject ():
    qry="SELECT * FROM `mange_subject` JOIN `mange_allosub` ON `mange_subject`.sub_id=`mange_allosub`.sub_id JOIN `courses` ON `mange_subject`.`course_id`=`courses`.`course_id`  WHERE staff_id=%s"
    res = selectall2(qry, session['lid'])
    return render_template("subject view.html",val=res)


@app.route('/managenotes',methods=['get','post'])
def managenotes ():
    qry= " SELECT * FROM `notes` JOIN `mange_subject` ON `notes`.sub_id =`mange_subject`.sub_id"
    res = selectall(qry)
    return render_template("mange notes.html",val=res)

@app.route('/addnotes',methods=['get','post'])
def addnotes ():
    qry= "SELECT * FROM mange_subject "
    res=selectall(qry)
    return render_template("add notes.html",val=res)

@app.route('/manageqnans',methods=['get','post'])
def manageqnans ():
    qry = "SELECT * FROM `mange_question_answer` JOIN `manage exam` ON `mange_question_answer`.exam_id =`manage exam`.exam_id JOIN 'staff details' .staff_id ON 'manage_question_answer'.staff_id='staff deatils'.staff_id"
    res = selectall(qry)
    return render_template("manage qn and ans.html",val=res)

@app.route('/addqnans',methods=['get','post'])
def addqnans ():
    return render_template("add qn and ans.html")

@app.route('/manageexam',methods=['get','post'])
def manageexam ():
    return render_template("mange exam.html")


@app.route('/addexam',methods=['get','post'])
def addexam ():
    return render_template("add exam.html")

@app.route('/viewnotsta')
def viewnotsta ():
    return render_template("view not-staf.html")

@app.route('/viewsubstu')
def viewsubstu ():
    qry="SELECT * FROM `mange_subject` JOIN `mange_allosub` ON `mange_subject`.sub_id=`mange_allosub`.sub_id WHERE staff_id=%s"
    res = selectone(qry,session['lid'])
    return render_template("view subject-stu.html",val=res)

@app.route('/viewnotes')
def viewnotes ():
    qry = "SELECT * FROM 'notes' JOIN 'mange_subject' ON `notes`.sub_id =`manage_subject`.sub_id  JOIN 'staff details'ON 'ntes'.staff_id='staff details.staff_id"
    res = selectall(qry)
    return render_template("view notes.html")

@app.route('/viewresult')
def viewresult ():
    return render_template("view result.html")

@app.route('/adminhome')
def adminhome ():
    return render_template('admin home.html')

@app.route('/staffhome')
def staffhome ():
    return render_template('staff home.html')


@app.route('/studenthome')
def studenthome ():
    return render_template('student home.html')



@app.route('/testdet')
def testdet ():
    return render_template("test table.html")

@app.route('/attendtest',methods=['get','post'])
def attendtest ():
    return render_template("attend test.html")

@app.route('/viewnotstu')
def viewnotstu ():
    return render_template("view not-stu.html")



@app.route('/viewstaff')
def viewstaff ():
    return render_template("view staff.html")

@app.route('/managesubject',methods=['get','post'])
def managesubject ():
    qry="SELECT * FROM `mange_subject` JOIN `courses` ON `courses`.`course_id`=`mange_subject`.`course_id`"
    res=selectall(qry)
    return render_template("manage subject.html",val=res)

@app.route('/addsubject',methods=['get','post'])
def addsubject ():
    qry="SELECT * FROM courses"
    res=selectall(qry)
    return render_template("add subject.html",val=res)












app.run(debug=True)



















