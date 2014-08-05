package com.roisin.spring.forms;

import java.util.List;

import com.google.common.collect.Lists;

public class PreproSimpleForm {

	private List<String> attributeSelection;

	private String label;

	private String dataId;

	private String exportFormat;

	private String name;

	private String description;

	public PreproSimpleForm() {
		attributeSelection = Lists.newArrayList();
	}

	public List<String> getAttributeSelection() {
		return attributeSelection;
	}

	public void setAttributeSelection(List<String> attributeSelection) {
		this.attributeSelection = attributeSelection;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

	public String getExportFormat() {
		return exportFormat;
	}

	public void setExportFormat(String exportFormat) {
		this.exportFormat = exportFormat;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}