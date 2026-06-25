import re

with open('lib/features/authentication/presentation/sign_up_screen.dart', 'r') as f:
    content = f.read()

content = content.replace("context.go('/setup-workspace');", """
                            // Trigger auth state change before going to workspace setup
                            // context.read<AuthBloc>().add(SignInEvent('new@user.com', 'password'));
                            context.go('/setup-workspace');
""")

with open('lib/features/authentication/presentation/sign_up_screen.dart', 'w') as f:
    f.write(content)
