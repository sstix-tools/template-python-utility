# template-python-utility

Template repository for creating Python CLI utilities deployed via `sstix-tools` for **APT**, **RPM**, and **Nix** with **Zsh autocompletion**.

## Repository Structure
```
├── .github/workflows/
│   ├── release.yaml               # Automated packaging and release pipeline
│   └── test.yaml                  # CI test workflow
├── bin/
│   └── template-python-utility    # Main executable Python script
├── completion/
│   └── _template-python-utility   # Zsh completion definition
├── packaging/
│   ├── debian/                    # Debian package metadata (Depends: python3)
│   └── rpm/                       # RPM spec file (Requires: python3)
├── LICENSE
└── README.md
```

## How to Use This Template
1. Create a new repository in GitHub from this template under the `sstix-tools` organization.
2. Rename the files and occurrences of `template-python-utility` to your tool name:
   - `bin/template-python-utility` -> `bin/<your-tool>`
   - `completion/_template-python-utility` -> `completion/_<your-tool>`
   - `packaging/rpm/template-python-utility.spec` -> `packaging/rpm/<your-tool>.spec`
   - In `.github/workflows/release.yaml`: update `pkg_name="<your-tool>"`
   - In `packaging/debian/control`: update `Package:` and `Description:`
3. Implement your utility logic in `bin/<your-tool>`.
4. Commit your changes and tag a release:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```
5. GitHub Actions will automatically build Debian (`.deb`), RPM (`.rpm`), and Nix assets and dispatch a trigger to `sstix-tools/registry`.
