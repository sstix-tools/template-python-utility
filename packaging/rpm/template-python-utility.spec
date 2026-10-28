Name:           template-python-utility
Version:        %{version}
Release:        1%{?dist}
Summary:        Python CLI utility template
License:        MIT
BuildArch:      noarch
Requires:       python3

%description
A Python utility script packaged for sstix-tools.

%install
mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_datadir}/zsh/site-functions
install -m 0755 %{_sourcedir}/template-python-utility %{buildroot}%{_bindir}/template-python-utility
install -m 0644 %{_sourcedir}/_template-python-utility %{buildroot}%{_datadir}/zsh/site-functions/_template-python-utility

%files
%{_bindir}/template-python-utility
%{_datadir}/zsh/site-functions/_template-python-utility
