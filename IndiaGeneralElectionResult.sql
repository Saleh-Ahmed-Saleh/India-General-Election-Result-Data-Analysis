create database IndiaGeneralElectionResult
use IndiaGeneralElectionResult

select * from constituencywise_details

select * from constituencywise_results

select * from states

select * from partywise_results

select * from  statewise_results


 --====================================================================

--Total Seats
select count(Distinct Parliament_Constituency) as  Total_Seats from [constituencywise_results]




 --====================================================================

--What is the total number of seats available for elections in each state

select s.State as State_Name, count(cr.Constituency_ID) as Total_Seats_Available from  constituencywise_results cr
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
join states s On sr.State_ID = s.State_ID

Group by s.State
order by s.State 



 --====================================================================

 --Total Seats Won by NDA Allianz
 select sum(
 case when party In(
 'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM')
 Then Won Else 0 End) as NDA_Total_Seats_Won from partywise_results




 --====================================================================
  --Seats Won by NDA Allianz
 select Party as Party_Name, Won as Seats_Won  from partywise_results
Where Party In (
'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
) 
order by 
 Seats_Won desc



  --====================================================================

 --Total Seats Won by I.N.D.I.A. Allianz
 select Sum(
 Case When Party In(
	'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
) Then Won Else 0 End) as India_Allianz_Total_Seats
 
 from partywise_results





  --====================================================================

 --Seats Won by I.N.D.I.A. Allianz Parties
 select Party as Party_Name, Won as Seats_Won from partywise_results 
Where Party in (
	'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
) 
order by  Seats_Won desc




 --====================================================================

-- Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
Add Party_alliance varchar(50)

Update partywise_results 
set Party_alliance = 'I.N.D.I.A'

Where Party in (
'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				)



Update partywise_results
set Party_alliance ='NDA'
Where Party in (
'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
)

Update partywise_results
set Party_alliance = 'Other'
where Party_alliance is null

select * from partywise_results





 --====================================================================
--Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

Select count(cr.Constituency_ID) as Total_won_seats, p.Party_alliance 
 From constituencywise_results cr
 Join partywise_results p On cr.Party_ID = p.Party_ID

 Group by p.Party_alliance
 Order by Total_won_seats desc


 

  --====================================================================
--The top candidate's names who have the total votes,
-- party names, total votes, and the margin ,constituency, state?
 
 select cr.Winning_Candidate as Candidate,p.Party as Party_Name, cr.Total_Votes, cr.Margin as Margin_Of_Victory, cr.Constituency_Name, s.State 
 from constituencywise_results cr
 Join partywise_results p On p.Party_ID = cr.Party_ID
 Join statewise_results sr On sr.Parliament_Constituency = cr.Parliament_Constituency
 Join states s On s.State_ID = sr.State_ID

 order by Total_Votes desc




 --====================================================================
--Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
  select cr.Winning_Candidate as Candidate,p.Party as Party_Name, cr.Total_Votes, cr.Margin as Margin_Of_Victory, cr.Constituency_Name as Constituency, s.State  
 from constituencywise_results cr
 Join partywise_results p On p.Party_ID = cr.Party_ID
 Join statewise_results sr On sr.Parliament_Constituency = cr.Parliament_Constituency
 Join states s On s.State_ID = sr.State_ID
 Where s.State  =  'Uttar Pradesh'  and  Constituency= 'AMETHI'



 --======================
 --What is the distribution of EVM votes (Electronic voting machine) versus postal votes for candidates in a specific constituency?
 select  cd.Candidate , cd.[EVM Votes], cd.Postal_Votes, cd.Total_Votes , cr.Constituency_Name from  constituencywise_details  cd
 Join constituencywise_results cr On cr.Constituency_ID = cd.Constituency_ID
 
 Where cr.Constituency_Name  = 'MATHURA'
 order by cd.Total_Votes desc
 
  
  --What is the Total EVM votes (Electronic voting machine) versus postal votes for constituency?

 select sum(cd.[EVM Votes]) as Total_EVM_Votes  , sum(cd.Postal_Votes) as Total_Postal_Votes, cr.Constituency_Name   from  constituencywise_details  cd
 Join constituencywise_results cr On cr.Constituency_ID = cd.Constituency_ID
 
Group by cr.Constituency_Name 
order by  Total_EVM_Votes  desc






--Which parties won the most seats in States, and how many seats did each party win?
Select * From
(
Select *, ROW_NUMBER () over (partition by State order by  Won_seats desc) rnk
From
(select pr.Party, count(cr.Constituency_ID) as Won_seats, s.State as State from partywise_results pr
Join constituencywise_results cr On pr.Party_ID = cr.Party_ID
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
Group by pr.Party, s.State
) b
)a
where rnk = 1
order by  Won_seats desc







--Which parties won the most seats in a specific State, and how many seats did each party win?
select pr.Party, count(cr.Constituency_ID) as Won_seats, s.State as State from partywise_results pr
Join constituencywise_results cr On pr.Party_ID = cr.Party_ID
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
Join states s On sr.State_ID = s.State_ID

Where s.State = 'Andhra Pradesh'
Group by pr.Party, s.State
Order by Won_seats desc






--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
select s.State , count(distinct cr.Constituency_ID ) as Won_Seats,  pr.Party_alliance from partywise_results pr
Join constituencywise_results cr On cr.Party_ID = pr.Party_ID 
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
Join states s On s.State_ID = sr.State_ID
Group by pr.Party_alliance, s.State
Order by  Won_Seats desc



--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select  s.State ,
Sum(Case When pr.Party_alliance =  'NDA' Then 1 Else 0 End ) as NDA_Seats ,
Sum(Case When  pr.Party_alliance = 'I.N.D.I.A' Then 1 Else 0 End ) as INDIA_Seats ,
Sum(Case When  pr.Party_alliance = 'OTHER' Then 1 Else 0 End ) as OTHER
From  partywise_results pr

Join constituencywise_results cr On cr.Party_ID = pr.Party_ID 
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
Join states s On s.State_ID = sr.State_ID
Where
    pr.Party_alliance In ('NDA', 'I.N.D.I.A', 'OTHER')
Group by s.State
order by s.State 









--Which candidate received the highest number of EVM votes in each constituency (Top 10)? Solution-------->>>> 1
select top 10 cd.Constituency_ID, cr.Constituency_Name as Constituency , cd.Candidate, cd.[EVM Votes]  from  constituencywise_details cd
Join constituencywise_results cr On cd.Constituency_ID = cr.Constituency_ID

order by  cd.[EVM Votes]  desc






--Which candidate received the highest number of EVM votes in each constituency (Top 10)? Solution-------->>>> 2
select Top 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.[EVM Votes]
from 
    constituencywise_details cd
Join
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
where 
    cd.[EVM Votes] = (
        select Max(cd1.[EVM Votes])
        from constituencywise_details cd1
        where cd1.Constituency_ID = cd.Constituency_ID
    )
 order by 
     cd.[EVM Votes]  DESC;










-- For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?
select s.state as State,
count(Distinct cd.Candidate) as Total_Candidates,
count(Distinct cr.Constituency_ID) as Total_seats,
count(Distinct pr.Party) as Total_Parties,

Sum(cd.[EVM Votes]) Total_EVM_Votes, 
Sum(cd.Postal_Votes) Total_Postal_Votes,
Sum(cd.[EVM Votes] + cd.Postal_Votes ) as Total_Votes
from  constituencywise_results cr

Join constituencywise_details cd On cr.Constituency_ID = cd.Constituency_ID  
Join statewise_results sr On cr.Parliament_Constituency = sr.Parliament_Constituency
Join states s  On sr.State_ID = s.State_ID 
Join partywise_results pr On cr.Party_ID = pr.Party_ID

Where s.state ='Maharashtra'
Group by s.state

 




 SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State = 'Maharashtra';
