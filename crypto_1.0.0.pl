#!/usr/bin/perl

use MIME::Base64;
use bigint;
use Math::BigInt;
use Term::ANSIColor;
use File::Slurp;

#############################
# Important! Place the file in desktop, in terminal: 1) cd Desktop 2) ./crypto.pl
# Need to run this file in desktop so that it can make the file in your desktop,
# You don't need to, though if you don't, the file will be made in /Username/here.txt & file locations ect will be mixed up...
##############################
#  2 methods to DECRYPT the  #
# "ENCRYPTED" string.        #
#............................#
# 1.) Set the encrypted data #
# under the variable $string #
#                            #
# 2.) Have it read the data  #
# from a file.               #
###########################################
# EXAMPLES FOR "DECRYPTING THE ENCRYPTED  #
# 1.) $string = "ENCRYPTED DATA HERE!";   #
# 2.) $string = read_file('meznsp.txt');  #
##############################################################
# It's a whole lot smarter to just read the encrypted data   #
# from the file...                                           #
# As copying/pasting all that lot into this file is messy... #
##############################################################
# ENCRYPTING IT, WILL ALSO EXECUTE DECRYPT FUNCTION (for debugging purposes as I've found out sometimes it wont decrypt) -- seems to be fixed...
# 1 = encrypt;
# 2 = decrypt;

$method = "1";

if($method =~ /^(1)$/){
    # Encrypt
    $string = "Type something here to encrypt! :D"; #### Type something here to encrypt! # make sure to blackslash $ and @ and %
    print my_encrypt($string);
}
if($method =~ /^(2)$/){
    # Decrypt
    $string = read_file('iqmrrm.txt'); #### After Encrypting a string, it gives you a file name, input it here
    $key_value = "wL3|OqY1"; #### After Encrypting a string, it gives you a "Key" input it here
    print my_decrypt($string);
}

########################################
sub my_encrypt {
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
$semi_encrypted_string = encode_base64(encode_base64($new_lap));

    #############
    {
        @chars = ("A".."Z", "a".."z", "0".."9", "!", "@", "#", "\$", "%", "^", "&", "*", "(", ")", "~", "+", "-", "=", "[", "]", "{", "}", ",", "<", ">", "?", "\/", "\\", "\|");
        $carry_string .= $chars[rand @chars] for 1..8;
    }
    {
        @charz = ("a".."z");
        $file_name .= $charz[rand @charz] for 1..6;
    }
    for my $each_char (split //, $carry_string) {
        $carry_char = ord($each_char) ."\n";
        push (@massiveness, $carry_char);
    }
    $massive_creation = join "\n", @massiveness;
    $massive_creation =~ s/\n//g; ### gigantic NUMERIC SUM
    
    for my $each_crypted (split //, $semi_encrypted_string) { # for each PRE-Crypted Value
        $ord_each = ord($each_crypted);
        $massive_creation = Math::BigInt->new($massive_creation);
        $big_sum = $massive_creation + $ord_each;
        $coded_bigsum = encode_base64($big_sum);
        push (@big_limits, "<".$coded_bigsum.">");
    }
    $massive_sum = join "\n", @big_limits;
    $massive_sum =~ s/\n//g;
    # This should be return: {
        print color("red"), "\n================================\n", color("reset");
        print color("blue"), "Encrypted Data located in file:\n", color("reset");
        open(my $file, '>', $file_name.".txt");
        print $file $massive_sum;
        close $file;
        print color("green"), $file_name.".txt", color("reset") ."\n";
        print color("blue"), "Key:\n", color("reset");
        print color("green"), $carry_string, color("reset");
            $string = $massive_sum;
            print my_decrypt($string, $carry_string);
        print color("red"), "\n================================\n\n", color("reset");
    
    # } # end "return";
}

sub my_decrypt {
    my ($string, $key_value) = @_;
    $string =~ s/></\n/g;
    $string =~ s/<//g;
    for $key_value_spc_char (split //, $key_value) {
        $spt_key_value = ord($key_value_spc_char) ."\n";
        push (@spt_key, $spt_key_value);
    }
    $spt_key_massd = join("\n", @spt_key);
    $spt_key_massd =~ s/\n//g;
    @mass_along_side = split /\n/, $string;
    foreach $long_line (@mass_along_side) {
        $decode_long_line = decode_base64($long_line);
        $numerical_true = $decode_long_line - $spt_key_massd;
        push (@qwerty_values, $numerical_true);
    }
    foreach $tiny_chr_line (@qwerty_values) {
        $alpha_chrd = chr($tiny_chr_line);
        push (@alpha_true_colors, $alpha_chrd);
    }
    $rm_array = join("\n", @alpha_true_colors);
    $rm_array =~ s/\n//g;
    ### new code<<
$fresh = decode_base64(decode_base64($rm_array));
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
    if(length($real_lap) =~ "0"){$real_lap = "\n\nCould Not Decrypt: $key_value :: \n\n\n";}
    return "\n\nDecrypted Data: ".$real_lap."\n";
}

















