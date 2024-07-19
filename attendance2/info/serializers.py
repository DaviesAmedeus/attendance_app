from rest_framework import serializers
from .models import User, Dept, Course, Class, Student, Teacher, Assign, AssignTime, AttendanceClass, Attendance, AttendanceTotal, StudentCourse, Marks, MarksClass, AttendanceRange
from django.contrib.auth import authenticate


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class DeptSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dept
        fields = '__all__'


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'


class ClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = Class
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'


class AssignSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assign
        fields = '__all__'


class AssignTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = AssignTime
        fields = '__all__'


class AttendanceClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = AttendanceClass
        fields = '__all__'


class AttendanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attendance
        fields = '__all__'


class AttendanceTotalSerializer(serializers.ModelSerializer):
    class Meta:
        model = AttendanceTotal
        fields = '__all__'


class StudentCourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentCourse
        fields = '__all__'


class MarksSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marks
        fields = '__all__'


class MarksClassSerializer(serializers.ModelSerializer):
    class Meta:
        model = MarksClass
        fields = '__all__'


class AttendanceRangeSerializer(serializers.ModelSerializer):
    class Meta:
        model = AttendanceRange
        fields = '__all__'

class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        username = data.get('username')
        password = data.get('password')

        if username and password:
            user = authenticate(username=username, password=password)
            if user:
                if user.is_active:
                    data['user'] = user
                else:
                    raise serializers.ValidationError('User is deactivated.')
            else:
                raise serializers.ValidationError('Unable to log in with provided credentials.')
        else:
            raise serializers.ValidationError('Must include "username" and "password".')

        return data
