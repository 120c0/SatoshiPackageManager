#pragma once

#include <iostream>
#include <string>

class Option
{
public:
  explicit Option(const std::string&, const std::string& = "echo nothing") noexcept;

  virtual void setDescription(const std::string&) noexcept;
  const std::string &getCommand() const noexcept;
  virtual void setCommand(const std::string&) noexcept;
  const std::string &getDescription() const noexcept;
  virtual void setChecked(const bool) noexcept;
  const bool &getChecked() const noexcept;

  friend const std::ostream& operator<<(std::ostream&, const Option&) noexcept;

  virtual ~Option() noexcept = default;
private:
  bool __is_checked;
  std::string __description, __command;
};