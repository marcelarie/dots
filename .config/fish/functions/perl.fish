function perl
    if type -q perlbrew
        command perl
    else
        source ~/perl5/perlbrew/etc/perlbrew.fish
        echo 'perlbrew sourced :)'
        command perl
    end
end
