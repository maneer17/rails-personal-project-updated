SELECT
        sc.course_id AS course_id,
        a.id AS assignment_id,
        a.title,
        a.deadline,sc.student_id as student_id
      FROM student_courses sc
      JOIN students s ON s.id = sc.student_id
      JOIN courses c ON c.id = sc.course_id
      JOIN assignments a ON a.course_id =  c.id
      LEFT JOIN submissions su ON (su.student_id, su.assignment_id) = (s.id, a.id)
      WHERE a.deadline > NOW()
        AND su.id IS NULL;