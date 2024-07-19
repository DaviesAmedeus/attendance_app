from rest_framework import generics
from .models import Student, Teacher, AttendanceTotal, Marks
from .serializers import StudentSerializer, TeacherSerializer, AttendanceSerializer, MarksSerializer
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework import status


class StudentDetailAPI(generics.RetrieveAPIView):
    serializer_class = StudentSerializer
    lookup_field = 'USN'
    queryset = Student.objects.all()

class TeacherDetailAPI(generics.RetrieveAPIView):
    serializer_class = TeacherSerializer
    lookup_field = 'id'
    queryset = Teacher.objects.all()

class StudentAttendanceAPI(generics.ListAPIView):
    serializer_class = AttendanceSerializer

    def get_queryset(self):
        usn = self.kwargs['USN']
        student = Student.objects.get(USN=usn)
        return AttendanceTotal.objects.filter(student=student)

class StudentMarksAPI(generics.ListAPIView):
    serializer_class = MarksSerializer

    def get_queryset(self):
        usn = self.kwargs['USN']
        student = Student.objects.get(USN=usn)
        return Marks.objects.filter(studentcourse__student=student)

class LoginView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
        }, status=status.HTTP_200_OK)

class LogoutView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            refresh_token = request.data["refresh"]
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)