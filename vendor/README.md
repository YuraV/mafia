mafia
=====

mafiaapp


Rounds Does not Works at all for this moment !


MODELS:
    <b>player_role.rb</b></br>
    <b>game_role.rb</b></br>
DOES NOT WORK AS WELL, TRYING TO EXTRACT ROLIFY PROCESS OUT FROM APPOINTMENTS MODEL
</br>

APPOINTMENTS CAN BE CONSIDERED AS PLAYERS INSIDE OF GAME


Before start you need run in  concole <br> <b> rake create_admin</b>
If you want have admin permissoins you must log in  with credentials <br>
email :<b> admin@mafia.com</b>  <br>
pw: <b> mafiaadmin </b> <br>
Another way: <br>
1. Create user <br>
2. After set admin role for your user via rails c using next command <br>
<b>user.add_role('admin')<b>
