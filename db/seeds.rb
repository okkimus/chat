u1 = User.create name:"Mikko", password:"Salasana"
u2 = User.create name:"Jaakko", password:"sana"
u3 = User.create name:"Aino", password:"password"

m1 = u1.messages.create text:"Hello there"
m2 = u1.messages.create text:"How are you?"
m3 = u2.messages.create text:"Hi ya"
m4 = u2.messages.create text:"Gooood"
m5 = u2.messages.create text:"And you?"
m6 = u3.messages.create text:"Marvelous"
m7 = u3.messages.create text:"Excellent"

r1 = Room.create name:"School", password:"Pass", privacy:false
r2 = Room.create name:"FreeTime", password:"none", privacy:false

u1.rooms << r1
u1.rooms << r2
u2.rooms << r1
u3.rooms << r2

r1.messages << m1
r1.messages << m2
r1.messages << m3
r1.messages << m4
r1.messages << m5
r2.messages << m6
r2.messages << m7