<h1>Encryption and Decryption, lets see how far this goes!</h1>

  <h3>Details:</h3>
  
    myencrypt_1.0.3.pl is the only version that should be bothered with, previous versions aren't "public" friendly.
  
- Encryption using chr() ord() & base64.
- Perl Modules required:

    <strong>MIME::Base64::Perl;</strong> # or MIME::Base64;
    
    <strong>Math::BigInt;</strong> # Stopping large numbers from turning into scientific notation
    
    <strong>Term::ANSIColor;</strong> # Optional, mainly used for font coloring when running in command line(will need to edit code if you are not going to use this module).
    
    <strong>use File::Slurp;</strong> # When decrypting, for reading the encrypted file.

- This is a command line script.


<h3>Planned Updates</h3>
- Add a secondary Key
- Add different types of ways to deal with Key.
- Completely redo some parts of encryption, & add new techniques of mixing stuff up.
- Fix the problems listed.
- Create a seperate version [for CGI peoples as-well], which would be a module rather than (what it is currently) standalone script.

<h3>Problems</h3>
- Key length is set to a max of 6, at 8 length, encryption and decryption begins to fail as the length of encrypted data is drastically increased. Key Length of 6 seems to be "flawless".
- This encryption is extremely bulky, and gets extremely slow with large strings.

    For Example: 
      
      Before encryption $string = "Hello There!"; # length = 12.
      
      After Encryption with $key = "g3PCWK"; # encrypted length of data = 5720! Massive!!!
