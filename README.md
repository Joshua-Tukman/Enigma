# Enigma
Enigma Project for MOD1 at Turing 
According to the grading Rubric for this project, I was able to meet all expectations in terms of functionality. Both the encrypt
and decrypt command line interfaces work properly. The encrypt and decrypt methods in the Enigma class can work with randomly 
generated keys as well as using today's date. I did struggle to find a way to make the decrypt method able to handle empty spaces
("empty strings") that occur naturally between words and those that were randomly assigned empty spaces that the encrypt method 
assigned because an "empty string" is the 27 character in my alphabet array. However, I came up with what I think 
is a novel solution - When encrypting, my program assigns the "^" character instead of an empty string so that the decrypt 
method can distinguish between an empty space between words in the original message and one that might be generated while 
encypting. This "^" character is the only character that the program will not just pass along in both encrypt and decrypt. 

Negatives:
I wasn't able to make a stub work in my test suite for the date. I worked on it until the last minute. This was frustrating.
I also could have used pull requests more. 
Lastly, there might be more than 3 occasions where I commit more than one piece of functionality. 
I suspect that I created more classes than were necessary. 

Wins:
Throughout the project, I used Test Driven Development religiously. I completed the project without needing any outside 
guidance until it came to implementing the command line interface. David Tran helped me work through a couple questions.  
