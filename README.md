# The Enigma Machine

The Enigma machine was a field unit used in World War II by German field agents to encrypt and decrypt messages and communications.

# Rubric Self-Evaluation

### Functionality
The Enigma class is fully implemented with an encrypt and decrypt method, both which were abstracted into a single crypt method. The command line interface works according to the interaction pattern as well. I would have liked to create a module for file i/o, but decided not to given time.

All functionality works as expected, and is tested with various edge cases I could come up with.

### OOP
I choose to encapsulate the generation of keys, dates, and shifts into a module called Generator. I believe each method follows SRP, and returns a consistent data type which never forces the receiver of a message to guess what it is receiving.

While I can see an opportunity to break the Enigma class into smaller pieces, I feel it is not unproductively large and remains readable. I consistently improved how DRY the code was as the project progressed, which feels good even though there is room for improvement.

### Ruby Conventions & Metrics
I ran everything through Rubocop, and tend to pay close attention to indentation and I believe it all meets spec. I'm happy with the general readability of each method and worked to not stack methods or 'dig deeper' than necessary in any one location.

### TDD
I approached the majority of the project with full TDD, and had to get creative with finding expected encryption outputs, and retesting to make sure those outputs were correct. All methods are unit and integration tested across the Generator module and Enigma class. I would like to explore more unit testing on the core enigma.crypt method without testing via integration with encrypt/decrypt.

### Version Control
Definitely an area where I can improve, there are PR's that had scope beyond the named purpose, but I did what I could to detail those specifics in the description of the PR. I believe I'm close to meets expectations with this, but would like to improve. More planning up front mapping out the project will benefit me for sure.

### Overall
I'm content with how this project turned out, but also would like to continue working on it to do a cracker module. I made a decision to spend a lot of what would have been project time on final IC prep over the weekend to make sure I was in a good spot for that, so this project perhaps suffered as a result.

Definitely a fun one, and learned some cool things here. Cheers.