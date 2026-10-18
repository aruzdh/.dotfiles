# SSH and GPG keys

1. Create and set up your
  [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh)
  and
  [GPG](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
  keys.

1. Create `~/.dotfiles/gitconfig/.gitconfig.local`, and `stow` it, with your
  personal details:

    ```ini
    [user]
      name = Your Name
      email = your_email@example.com
      signingkey = YOUR_GPG_KEY_ID
    ```
