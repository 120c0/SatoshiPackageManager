#include "Option.hpp"

#include <iomanip>

Option::Option(const std::string &description, const std::string &command) noexcept
  : __is_checked(false)
{
  this->setDescription(description);
  this->setCommand(command);
}

void Option::setDescription(const std::string &description) noexcept
{
  this->__description = description;
}
const std::string &Option::getDescription() const noexcept
{
  return this->__description;
}
const std::string &Option::getCommand() const noexcept
{
  return this->__command;
}
void Option::setCommand(const std::string &command) noexcept
{
  this->__command = command;
}
void Option::setChecked(const bool is_checked) noexcept
{
  this->__is_checked = is_checked;
}
const bool &Option::getChecked() const noexcept
{
  return this->__is_checked;
}

const std::ostream& operator<<(std::ostream &out, const Option &option) noexcept
{
  out << option.getDescription() << std::setfill(' ') << std::setw(30 - option.getDescription().size() + 4) << " [" <<
    (option.getChecked() ? '#' : ' ') << "]\n";
  return out;
}