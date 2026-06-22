for file in $(find lib -name "*.dart"); do
  if grep -q "\.w\|\.h\|\.r\|\.sp" "$file" && ! grep -q "import 'package:flutter_screenutil/flutter_screenutil.dart';" "$file"; then
    echo "Adding flutter_screenutil to $file"
    sed -i '1i import '\''package:flutter_screenutil/flutter_screenutil.dart'\'';' "$file"
  fi
done

for file in $(find lib -name "*.dart"); do
  if grep -q "context\.push\|context\.pop\|context\.go" "$file" && ! grep -q "import 'package:go_router/go_router.dart';" "$file"; then
    echo "Adding go_router to $file"
    sed -i '1i import '\''package:go_router/go_router.dart'\'';' "$file"
  fi
done
