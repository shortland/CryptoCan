#!/usr/bin/perl
# 1.2.0 rr

# Known Bugs:
# - When entering a file (path), File::Slurp has errors interpreting spaces in the file path/name.

# Partner to Partner transmitting:
# P2P::Transmission::Remote;

use MIME::Base64::Perl;
use Math::BigInt;
use Term::ANSIColor;
use File::Slurp;

print color("yellow"), "========= My Encrypt/Decrypt 1.0.4 =========\n\n", color("reset");
print "Please choose a method:\n (1) Encrypt\n (2) Decrypt\nMethod: ";
chomp ($method = <STDIN>);

if($method =~ /^(1)$/){
    # Encrypt
    print color("yellow"), "====================================\n\n", color("reset");
    print "Would you like to encrypt a file's text contents? Or a single string?\n (1) File Content's\n (2) Simple String\nChoice: ";
    chomp ($chosen = <STDIN>);
    
    print color("yellow"), "====================================\n\n", color("reset");
    print "What Directory would you like this script to place the encrypted output in?\n(If doesn't exist, will make directory)\nDirectory: ";
    chomp ($directory = <STDIN>);
    
    print color("yellow"), "====================================\n\n", color("reset");
    print "What would you like the file name to be of the encrypted data?\n(File will be in the directory: $directory [Path to directory is location where this script])\nFile Name: ";
    chomp ($file_name = <STDIN>);
    
    print color("yellow"), "====================================\n\n", color("reset");
    print "Would you like to use a random encryption key or your own?\n (1) My own\n (2) Random\nChoice: ";
    chomp ($crypt_choice_key = <STDIN>);
    
    if($crypt_choice_key eq "1"){
    key:
        print color("yellow"), "====================================\n\n", color("reset");
        print "What would you like your key to be?\nMaximum 6 Letters/Numbers long.\nKey: ";
        chomp ($carry_string = <STDIN>);
        if(length($carry_string) > 6){
            print color("yellow"), "====================================\n\n", color("reset");
            print color("red"), "Unable to use a key that large!", color("reset"), "\n\n";
            goto key;
            
            print color("yellow"), "====================================\n\n", color("reset");
        }
    }
    if($crypt_choice_key eq "2"){
        print color("yellow"), "====================================\n\n", color("reset");
        @chars = ("A".."Z", "a".."z", "0".."9");
        $carry_string .= $chars[rand @chars] for 1..6; # increasing "salt" past 6 is known to be faulty.
        print "Using Key: $carry_string \n";
    }
    
    ### maybe add option to encrypt/decrypt an entire file contents eventually
    if($chosen =~ /^(1)$/){
        print color("yellow"), "====================================\n\n", color("reset");
        print "Please enter the full file path of the file to encrypt (ie: /Users/MyName/Desktop/CryptoCan/encrypt_this_file.txt ):\nFile Path: ";
        chomp ($pathtoFile = <STDIN>);
        $string = read_file($pathtoFile)
        
    }
    if($chosen =~ /^(2)$/){
    print color("yellow"), "====================================\n\n", color("reset");
    print "Type in a string you would like to encrypt:\nString: ";
    chomp ($string = <STDIN>);
    }
    
    print color("yellow"), "====================================\n\n", color("reset");
    print color("green"), "Encryption in process... Heads up! Encryption might take awhile depending on how long the string is you're encrypting. Same goes for decrypting. \nPercent (%) complete coming soon!\nEncrypting! ... ... ...".color("reset");

    {print my_encrypt($string, $carry_string)};
}
if($method =~ /^(2)$/){
    print color("yellow"), "====================================\n\n", color("reset");
    print "What directory is the file located in?\nDirectory name: ";
    chomp ($directory = <STDIN>);
    
    print color("yellow"), "====================================\n\n", color("reset");
    print "What is the file name with the encrypted contents?\nName: ";
    chomp ($filename = <STDIN>);
    
    print color("yellow"), "====================================\n\n", color("reset");
    print "What is the encryption key?\nKey Value: ";
    chomp ($key_value = <STDIN>);
    # Decrypt
    
    print color("yellow"), "====================================\n\n", color("reset");
    
    $string = read_file("${directory}/${filename}"); #### After Encrypting a string, it gives you a file name, input it here
    print color("blue"), "Decrypted Data:\n\n", color("red"), my_decrypt($string, $key_value, $iv), color("reset"), "\n\n";
    print color("yellow"), "====================================\n\n", color("reset");
}

### BEGIN functions

sub iv_encrypt {
    my ($random) = @_;
    # Impacts formulas ( * / ) when implementing key.
    
    my @string_array = split(//, $string);
    foreach $letter (@string_array) {
        push(@ordered, ord($char));
    }
    foreach $letter2 (@ordered) {
        push(@ordered2, ord($letter2));
    }
    foreach $letter3 (@ordered2) {
        push(@ordered3, ord($letter3));
    }
    $iv = join "", @ordered3;

    return $iv;
}

sub my_encrypt {
    my ($string, $carry_string) = @_;
    if (-d "$directory") {
        # directory exists
    } else {
        `mkdir $directory`;
    }
    # mk IV
    #@charsiv = ("1".."9");
    #$random .= $chars4iv[rand @charsiv] for 1..4;
    #$iv = iv_encrypt($random);
    my @characters = split(//, $string);
    foreach my $char (@characters) {
        $encrypted_char = (encode_base64(ord($char)));
        push (@list, $encrypted_char);
    }
    $overlap = join "", @list;
    $overlap =~ s/\n//g;
    $wack = encode_base64($overlap);
    my @coded_characters = split(//, $wack);
    foreach my $coded_char (@coded_characters) {
        $re_encrypted_char = (encode_base64(ord($coded_char)));
        push (@coded_list, $re_encrypted_char);
    }
    $new_lap = join "", @coded_list;
    $new_lap =~ s/\n//g;
    $semi_encrypted_string = $new_lap;
    # New code Bellow.
    
    for my $each_char (split //, $carry_string) {
        $carry_char = ord($each_char) ."\n";
        push (@massiveness, $carry_char);
    }
    $massive_creation = join "\n", @massiveness;
    $massive_creation =~ s/\n//g; ### gigantic NUMERIC SUM
    for my $each_crypted (split //, $semi_encrypted_string) { # for each PRE-Crypted Value
        $ord_each = ord($each_crypted);
        $massive_creation = Math::BigInt->new($massive_creation);
        $big_sum = $massive_creation * $ord_each;
        $coded_bigsum = encode_base64($big_sum);
        push (@big_limits, "<".$coded_bigsum.">");
    }
    $massive_sum = join "\n", @big_limits;
    $massive_sum =~ s/\n//g;
    # Wrap it up.
    open(my $file, '>', "$directory/".$file_name);
    print $file $massive_sum;
    close $file;
    
    return color("red"), "\n====================================\n", color("reset"), color("blue"), "Encrypted Data location:\n", color("reset"), color("green"), "$directory/".$file_name, color("reset") ."\n", color("blue"), "Key:\n", color("reset"), color("green"), $carry_string, color("reset"), "\n\n",color("blue"),"Encrypted Data Length:",color("reset"), "\n", length($massive_sum)."\n" , color("red"), "====================================\n\n", color("reset");
}

sub my_decrypt {
    my ($string, $key_value, $iv) = @_;
    $string =~ s/></\n/g;
    $string =~ s/<//g;
    $string =~ s/>//g;
    for $key_value_spc_char (split //, $key_value) {
        $spt_key_value = ord($key_value_spc_char) ."\n";
        push (@spt_key, $spt_key_value);
    }
    $spt_key_massd = join("\n", @spt_key);
    $spt_key_massd =~ s/\n//g;
    
    @mass_along_side = split /\n/, $string;
    foreach $long_line (@mass_along_side) {
        $decode_long_line = decode_base64($long_line);
        $numerical_true = $decode_long_line / $spt_key_massd;
        push (@qwerty_values, $numerical_true);
    }
    foreach $tiny_chr_line (@qwerty_values) {
        $alpha_chrd = chr($tiny_chr_line);
        
        push (@alpha_true_colors, $alpha_chrd);
    }
    $rm_array = join("\n", @alpha_true_colors);
    $rm_array =~ s/\n//g;
    # new code above
    $fresh = ($rm_array);
    @flat_chars = ($fresh =~ m/..../g);
    foreach my $to_decode_char (@flat_chars) {
        $decoded_char = decode_base64($to_decode_char);
        $step2_decoded_char = chr($decoded_char);
        
        push (@decoded_list, $step2_decoded_char);
    }
    $di_coded = join "", @decoded_list;
    $di_decoded = decode_base64($di_coded);
    @quad_chars = ($di_decoded =~ m/..../g);
    foreach my $numeric_char (@quad_chars) {
        $re_decoded_char = decode_base64($numeric_char);
        $re_decrypted_num = chr($re_decoded_char);
        push (@real_list, $re_decrypted_num);
    }
    $real_lap = join "", @real_list;
    if(length($real_lap) =~ "0"){$real_lap = "Failed to decrypt";}
    return $real_lap;
}

















