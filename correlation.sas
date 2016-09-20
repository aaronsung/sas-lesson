proc format;
value $fsex
1="Male"
2="Female";
run;

data mathscore;
set sas2.mathscore;
format sex $fsex.;
/*label caseid ="Subject Number" mathsat ="SAT Math Score" score = "Final Calculus Score" sex ='sex of Participant' teach ='Student Rated Teaching Ability'; */
run;

proc corr data = mathscore;
var mathsat score teach;
run;
