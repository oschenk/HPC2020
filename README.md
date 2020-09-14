# HPC2020
Lecture Repository of the High Performance Computing Course 2020 at USI, Lugano

**Professor:** Olaf Schenk

**TA:** Aryan Eftekhari, Dimosthenis Pasadakis, Radim Janalik, Juraj Kardos, Tim Holt

**Class & Exercises:** Tuesday 14:30-16:00 (SI‐006), Wednesday 16:30-18:00 (SI-006)

**First date:** The HPC Lab course will start on Wednesday September 16, 4:30pm (General remarks, Installation of Intel MKL Software, MPI, etc) on Microsoft Teams.

## Online
On Microsoft Teams, initial limited support in room SI-006. Please join us on Microsoft Teams to ask questions. The Microsoft Teams session will start on Wednesday September 16, 4.30pm to 6:00pm. We will also use a spatial meeting chat room on a regular basis. Please join us on SpatialChat.

## Course Description
The course is designed to teach students how to program parallel computers to efficiently solve challenging problems in science and engineering, where very fast computers are required either to perform complex simulations or to analyze enormous datasets. This course is a graduate-level introduction to high performance computing. It refers to two things: efficient as the problem size grows, and efficient as the system size measured in numbers of cores grows. The course is organized as an HPC Lab. The practical aspect of this course is implementing the techniques you’ll learn to run on real parallel systems, so you can check whether what appears to work well in theory also translates into practice.Programming models you’ll use include include include OpenMP, and MPI, and possibly others. Therefore, this computing lab consists of hand-on projects on HPC. Students will also be offered a number of exercises on performance analysis, parallelism detection and efficient development for modern manycore processors using OpenMP and MPI. This experience will be very useful for individual semester projects in other classes, where students might develop & deploy components of massively parallel numerical simulation software. GPU computing will not be covered in this course. It will be fully discussed in the annual CSCS-USI Summer School on Effective High-Performance Computing & Data Analytics with GPUs where we will focus on the effective exploitation of state-of-the-art hybrid High-Performance Computing (HPC) systems with a special focus on Data Analytics. The content of the summer school course is tailored for intermediate graduate students interested in both learning parallel programming models, and having hands-on experience using HPC systems. Starting from an introductory explanation of the available systems at CSCS, the course will progress to more applied topics such as parallel programming on accelerators, scientific libraries, and deep learning software frameworks. The following topics will be covered: GPU architectures, GPU programming, Message passing programming model (MPI), Performance optimization and scientific libraries, interactive supercomputing, Python libraries, Introduction to Machine Learning, and GPU optimized framework. The Summer School will be held from July 13 to 24, 2021, at the Steger Center in Riva San Vitale, located in the Italian area of Switzerland. More information is available at this Link.  Students will be able to earn six ECT credit points for this GPU course from USI (subject to exam).

## Lecture Slides, Projects and Solutions
Each project description will be provided as part of this private git repository and on the iCorsi page.

## Lab & Coursework
The lab requirements include programming of mini-projects and other assignments; final written examination. All of these will count in your final grade. The final grade will be calculated by averaging the two elements with weights

seven to nine mini-projects: 60%, the  mini-projects must be passed with a grade of at least 6/10.
final oral exam: 40%.
Value in ECTS: 6

## Final oral exam
In the oral exam, we will review these computing projects and the theory behind it, and discuss various aspects of these methods. The oral exam will cover material from the entire course and we might discuss your solutions.

## Regrading requests
If you feel that you deserve a better grade for a mini-project, you may submit a regrade request. It must be in writing to the TA. This regrading request must be done within one week after the assignment have been graded by the TA. Your request should briefly summarize why you feel that the original grade was unfair. Your TA will take a day or two to reevaluate your assignment, and then issue a decision. If you are still not satisfied, you can appeal the decision to Professor Schenk. (Again, the appeal must be in writing.) Note that your entire assignment may be reevaluated, not just the question that you submit for regrade.

## Late day policy
All projects are due in class on the assigned due date. We recognize that students may face unusual circumstances and require some flexibility in the course of the semester, therefore each student will be granted ONE free assignment that we will not count for the final grading of the mini-projects.

## Assignment collaboration policy
You are allowed to discuss such questions with anyone you like; however:

* Your submission must list anyone you discussed problems with.
* You must write up your submissions independently.

## Submission
If you want to receive feedback on your exercises, please submit/upload your solution to this iCorsi webpage. Your exercise will then be corrected within a period of three weeks (maybe earlier).

## General session
Join Microsoft Teams using this Microsoft Teams Link.

## Personal session:
Olaf Schenk's Personal Meeting Room: MS Teams.
Edoardo Vecchi's Personal Meeting Room: MS Teams.
Dimosthenis Pasadakis' Personal Meeting Room: MS Teams.
Lisa Gaedke-Merzhaeuser's Personal Meeting Room: MS Teams.

## Programming
We will use C/C++, Matlab, MPI, and the Intel Math Kernel Library for the mini-project programs.

## Useful links on computing
* Hager and G. Wellein: Introduction to High Performance Computing for Scientists and Engineers, ISBN 143981192X, CRC Computational Science Series, 2010.
* (ETH link)
* S. Goedecker and A. Hoisie: Performance Optimization of Numerically Intensive Codes. Like many HPC books, slightly outdated but still very useful. Does not cover recent developments like EPIC and SIMD instruction sets.
* (ETH link)
* K. Wadleigh and I. Crawford: Software Optimization for High Performance Computing. This is a very good book that is however slightly outdated and unfortunately out of print. You can get it at,e.g., abebooks.com.
* K. Dowd and C. Severance: High Performance Computing (RISC Architectures, Optimization & Benchmarks). Covers traditional optimization techniques in detail. Out of print but available at Amazon.com etc.
* R. Gerber: The Software Optimization Cookbook. Contains also some material on SIMD programming with SSE.
* Helmut Katzgraber: Scientific Software Engineering in a Nutshell.
* The SGI Origin 2000 and Onyx2 Performance Tuning and Optimization Guide is still a great resource for learning the basics of code optimization, although those machines have long since disappeared. Just ignore the system-specific stuff.
* A. Grama, A. Gupta, G. Karypis, V. Kumar: Introduction to parallel computing. In-depth treatment of parallel hardware models, parallel programming paradigms and parallel algorithms. Available at Link.
* T. Mattson, B. Sanders, B. Massingill: Patterns for Parallel Programming. A compendium of concepts required for parallel program design, accompanied by sample implementations. Available at Amazon.com.
* W. Gropp, E. Lusk, A. Skjellum: Using MPI - Portable Parallel Programming with the Message-Passing Interface, MIT Press, 1999. It covers the basics without too much fluff.
* (ETH link)
* MPI documentation can be found online in the MPI forum. Note: Some MPI implementations only support the MPI 1.2 standard, but that should not matter for this lecture.
* The official OpenMP specification contains quite a lot of good examples and can therefore be used as a good and readable reference for more information on OpenMP.
* R. Chapman, G. Jost and R. van der Pas: Using OpenMP. This book not only gives a thorough introduction to OpenMP but also covers the most relevant performance and correctness issues, together with best practices.
* (ETH link)
* The MIT Missing Semester of Your CS Education: Classes teach you all about advanced topics within CS, from operating systems to machine learning, but there’s one critical subject that’s rarely covered, and is instead left to students to figure out on their own: proficiency with their tools. This courses teach you how to master the command-line, use a powerful text editor, use fancy features of version control systems, and much more (USI LINK).
* Introductory, very basic tutorials from Lawrence Livermore National Laboratory (LLNL):
  * Introduction to Parallel Computing
  * OpenMP tutorial
  * MPI Tutorial
