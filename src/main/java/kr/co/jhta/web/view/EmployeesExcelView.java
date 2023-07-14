package kr.co.jhta.web.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.jhta.vo.Employee;

@Component
public class EmployeesExcelView extends AbstractXlsxView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		List<Employee> employees = (List<Employee>) model.get("items");
		
		// 여기까지 하면 엑셀파일 들어옴 (안에는 비어있음)
		Sheet sheet = workbook.createSheet("Employees");
		
		// 헤더부에 값 채우기
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("아이디");
		headerRow.createCell(1).setCellValue("이름");
		headerRow.createCell(2).setCellValue("이메일");
		headerRow.createCell(3).setCellValue("전화번호");
		headerRow.createCell(4).setCellValue("입사일");
		headerRow.createCell(5).setCellValue("직종");
		headerRow.createCell(6).setCellValue("급여");
		headerRow.createCell(7).setCellValue("커미션");
		headerRow.createCell(8).setCellValue("관리자");
		headerRow.createCell(9).setCellValue("부서아이디");
		headerRow.createCell(10).setCellValue("부서명");
		
		// 
		int rowIndex = 1;
		for (Employee emp : employees) {
			Row dataRow = sheet.createRow(rowIndex);
			
			dataRow.createCell(0).setCellValue(emp.getId());
			dataRow.createCell(1).setCellValue(emp.getFirstName() + " " + emp.getLastName());
			dataRow.createCell(2).setCellValue(emp.getEmail());
			dataRow.createCell(3).setCellValue(emp.getPhoneNumber());
			dataRow.createCell(4).setCellValue(emp.getHireDate());
			dataRow.createCell(5).setCellValue(emp.getJob().getId());
			dataRow.createCell(6).setCellValue(emp.getSalary());
			if(emp.getCommissionPct() != null) {
				dataRow.createCell(7).setCellValue(emp.getCommissionPct());
			}
			if (emp.getManager() != null) {
				dataRow.createCell(8).setCellValue(emp.getManager().getFirstName() +" "+ emp.getManager().getLastName());
			}
			
			if(emp.getDepartment() != null) {
				dataRow.createCell(9).setCellValue(emp.getDepartment().getId());
				dataRow.createCell(10).setCellValue(emp.getDepartment().getName());
			}
			
			rowIndex++;
		}
	}
	

}
