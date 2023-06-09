#include <iostream>
#include <vector>

extern "C"
{
  #include <unistd.h>
}

#include "Option.hpp"

static std::vector<Option> options {
  Option("[I want install selected package]", "echo \"Install Mode...\""),
  Option("Alacritty [+Rust] (0.12.1)", "bash scripts/alacritty.sh"),
  Option("Neovim (0.9.1)", "bash scripts/neovim.sh"),
  Option("Neovim Setting Hemisu Theme", "bash scripts/neovim-hemisu-theme.sh"),
  Option("i3-wm (Debain 11)", "bash scripts/i3wm.sh"),
  Option("Alacritty Hyper Theme", "bash scripts/alacritty-hyper-theme.sh")
};

void prompt(void)
{
  system("clear"); int index = 1;

  std::cout << "| Recommended system: Rasoberry Pi OS Lite |\n\n";
  for(const Option& option : ::options)
    std::cout << ' ' << index++ << " - " << option;
  std::cout <<
		"99 - " << (::options.front().getChecked() ?
		"Install" : "Exit") << "\n\nInput >> ";
}

void select_option(const std::string &index)
{
  std::size_t array_index = atoi(index.c_str());
  if(array_index > 0 && array_index <= ::options.size())
  {
    Option &option = ::options[array_index - 1];
    option.setChecked(!option.getChecked());
  } else {
    system("clear");
    std::cerr << "\033[31mOption not valid...\n\033[0m]";
    sleep(1);
  }
}

void install_packages()
{
  if(::options.front().getChecked())
	{
    for(const Option &option : ::options)
      if(option.getChecked()) system(option.getCommand().c_str());
	}
  else
    std::cout << "Exting without install anything...\n";
}

int main(void)
{
  std::string index;
  
  for(;;)
  {
    prompt();

    std::getline(std::cin, index);
    if(index == "99")
      break;

    select_option(index);
  }
  install_packages();

  return EXIT_SUCCESS;
}
