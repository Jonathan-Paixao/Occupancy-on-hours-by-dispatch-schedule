# Occupancy-on-hours-by-dispatch-schedule

Focused on optimizing and updating factor logic and how the dispatch schedule is being filled, based on standard forecast times.

---
## The start

  The initial objective was undestand how the “Fator” works. After this, we made a try on how we could use the Fator on the already created transportation and on non-transportation orders.
The main goal now was create a view where we can see the amount of hours already being in use by the orders created (on the operation), how many hours we have avaliable to be created, and of this amount, how many we actually can use (thinking on the capacity resting already).

<img width="747" height="159" alt="image" src="https://github.com/user-attachments/assets/8d048338-4889-4505-a5d9-87f19eb04d89" />

---
## The surprises

  While working on this logic, the need of working on a actual avaliable dashboard and turn a view of amount to lines was needed. So, we made way to “Visão Gerencial Peças”, where it could be changed values showing to show the dificult on the already values ongoing on the dashboard.

<img width="1024" height="572" alt="image" src="https://github.com/user-attachments/assets/b3a184af-32a9-4c6f-a0f5-f89a6e1c8a89" />


  While doing this, the possibility of showing more than asked appear. And now, it’s being worked the possibility of showing the vision of “how many Fators the alreaady existing values are being held”.


<img width="1024" height="572" alt="image" src="https://github.com/user-attachments/assets/884c3d09-4546-4d74-8c67-35ca02705485" />

---
## A new point of view
  After creating the new vision using the “Controle de remessas” table, now the team aiming to show and create the “Ocupação da grade expedição” with more precision, now just needing a base screen to make the calculator.
Was said to Raphael that maybe the actual table wont work, but now it’s just needed to sit with Anderson and understand what’s the limit on a single Faixa de Frete and if they make any other filter to create a transportation.

  To follow to the next step, it was necessary to make a new step:

https://jonathan-paixao-csicargo.atlassian.net/jira/core/projects/GDD/board?groupBy=status&selectedIssue=GDD-45#:~:text=To%20follow%20to,em%20semana%20passada

  Understanding the logic of “Current schedule”, was possible to identify which transations on SAP would be necessary to input on BigQuery to have a fully automatic schedule. With this, we now could possiblity re-create and understand the hours-wasted on what operation are doing, but would still need the vision of what could possiblity be created.

---
## **Needing:**

  Understand which screen the information in the "Transportation" tab of the schedule comes from.
  
---

## **Answer:**

  The current schedule are constructed by 4 transations on SAP:
- ZSTR155 - (“Calendário” variant);
- ZSTR06 - (“Calendário” variant);
- ZP80 - (Vlookup’s);
- ZVA3 - (“Calendário” variant);

---

# Update on 05/08/2025

  While testing how the current schdule would work with the fator, could be possible to identify that the Fator wont go too far to cases when the difficulty was very high, so it was made a new REWORK on the fator that could possiblity turn a new way to see how many hours we would waste on everything.

# Update on 06/08/2025

About the “Visão Gerencial Peças”, it’s almost done. We just need now to set some small details and then it’s done. But, lookingo for the future, will be needed acess to ZVAE on Bigquery if it’s wanted to create different filters and vision besides this static one.

# Update on 08/08/2025

After a shortly validation with Raphael on 07/08, he accepted the view on [Faturado] - Visão Gerencial Peças and asked to this one be put on the actual Visão Gerencial Peças. It’ll be done between 08/08 and 12/08.

This is how the view looks on 08/08

<img width="1024" height="576" alt="image" src="https://github.com/user-attachments/assets/5ac15b81-6960-443b-b692-84cea6e4dbcf" />