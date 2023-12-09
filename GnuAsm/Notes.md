* What it means to have a 64-bit computer is that the computer can, in a
single instruction, add together two 64-bit numbers. You can still add 64-bit numbers
with a 32-bit or even an 8-bit computer; it just takes more instructions.

* So, hopefully by now you see how computers store numbers. But don’t computers store
all sorts of other types of data, too? Aren’t computers storing and processing words,
images, sounds, and, for that matter, negative or even non-integer numbers?
This is true, but it is storing all of these things as numbers. For instance, to store
letters, the letters are actually converted into numbers using ASCII (American Standard
Code for Information Interchange)

* So how does the computer know which numbers are which? Fundamentally,
the computer doesn’t. All of these values look exactly the same when stored in your
computer—they are just numbers.

* What makes them letters or numbers or images or sounds is how they are used. If I
send a number to the graphics card, then it is a color. If I add two numbers, then they are
numbers. If I store what you type, then those numbers are letters. If I send a number to
the speaker, then it is a sound. It is the burden of the programmer to keep track of which
numbers mean which things and to treat them accordingly.
This is why files have extensions like .docx, .png, .mov, or .xlsx. These extensions
tell the computer how to interpret what is in the file. These files are themselves just long
strings of numbers. Programs simply read the filename, look at the extension, and use
that to know how to use the numbers stored inside.

* There’s nothing preventing someone from writing a program that takes a word
processing file and treating the numbers as pixel colors and sending them to the screen
(it usually looks like static) or sending them to the speakers (it usually sounds like
static or buzzing).

* You can think of memory as boxes, where
each box is *1 byte big*. Each memory box has an address, which tells the computer how
to find it. I can ask for the byte that is at address 279,935 or at address 2,341,338. If I know
the address, I can go find the value in that location. Because they are bytes, each value
will be between 0 and 255. Figure 2-1 gives a visual for what this looks like.
Now, since we are on 64-bit computers, we can actually load bigger values. We will
typically be loading 8 bytes at a time. So, instead of asking for a single byte, we will be
asking for 8 bytes, starting with the one at the given address. So if we load from address
279,935, we will get all of the bytes from address 279,935 to 279,942.


* the memory itself doesn’t have any knowledge of
whether or not a value is a single byte or multiple bytes. For the memory, it is all stored
a byte at a time. However, if you were to access a memory location as a quadword (i.e.,
8 bytes), it would treat the memory at that address and the next seven locations after as
a single unit. So, accessing a quadword from memory address 0014 in the figure would
actually use all of the values from 0014 to 0021 as one giant value.

* The computer essentially runs an endless cycle of the following operations:
1. Read the instruction from the memory address specified by the
instruction pointer.
2. Decode the instruction (i.e., figure out what the instruction
means).
3. Advance the instruction pointer to the next instruction.5
4. Perform the operation indicated by the instruction.

