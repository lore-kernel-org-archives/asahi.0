Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5C439F78
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492831; cv=none; b=B1p5zLuJFLD8F2vxyapIOwwmZJYh/esnG6w5hxh2gdYmEJRww0yzyTQesuWqPxYs+j5JrSiu2rGb9FZqvzfQVL8Smm9ym/FXvb36eXM3sSkmuwD+1v8+UtlN+K5eMTPfsLriNzoqAoNhauVNuzBwD59clQzxBK69b5VRbXluiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492831; c=relaxed/simple;
	bh=dbvG9K249lCyefMM14BZFhgNNJ3r5ozhGD93sWzhaiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YND/UXMkEZdw8mc6ICjAiMCQGqymfiA9dMA86mgHoNn0zmwcqgrurkj4ngv00r5VByXhNa4ytRSQ8mK+NEirGQqDKgB5EqKXHtil+LgVZmPfsx8YEA1QeQVBTT/7wHwLBbVrbqMFxLSjPIWZvmM3MlKxiCap6UNG4j0MeJ0qx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifTziyLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+0MmpgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifTziyLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+0MmpgE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAOYG813396
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 17:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=; b=ifTziyLKh9qzhc1M
	h8KULEL9XrG6sJ2Rxlru+TfiJczyUGqhJ13qjf7svvEAifWQjljbmR47S2Hs37ba
	n/gsT3aNTx7fenoFUw7v8edZuhLjxq/u4FzY6RXGs3geaSXMOxDBbFAzIpgimX+J
	JLOlG0YiSh//NFveu/QvVtQOoYJ0E9JLDWgio2kMxVb6nTyQAlsaEbmHIiyXwzpj
	NA83F6w9ZAw53xoTmE67j5FTiUasg9hygKStaKkM+nbAbYJiE8NX+O74ah0Hm3sQ
	aRFUnezZsufP6L4iwstUQISsY+4g1tutYXa8eJeDeCS7WJKNjFjOFZBOQrjxbuJO
	bodP/Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc1fa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 17:20:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fcc331099so184242137.0
        for <asahi@lists.linux.dev>; Tue, 15 Sep 2026 10:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789492828; x=1790097628; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=X+0MmpgEjOocEsCLO692K0NByoZvRm1F56skH4Ye2Q/tfMFfhHeOTgeSi/3IHwkWmR
         lF3jJOY/05CY4LXunSuH4msDZzMaA7iFy0jWhNSjGARLV6Vi+o6CpQdouo38M1sCjRQ9
         XYH1oVAFZwJqmYLhPTHa438g1Tb9XhcXH1VGovUr+ECV8FX+/Ks0tswiKpdJZPYcaaEg
         P1i7luvV6ApdSspQt+kNMRKDYRH9zrcvuK3CCUH26YBii9FW6P/XxqPq/MIT5UHiTZa3
         9jl8KievkMgt1YFgIH+nYc1IE9OUoFArNxbmLVVawuW/KFttBuGl2q1+4Ztso4+UMZz4
         IpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492828; x=1790097628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH7lCAzw2uCbu1htPtaHlO71VpSzeKajhsaa41t5N44=;
        b=kZtdJ+DKKLj29In5po4IKXE0Dgj3wTk+BuwlSsdo+khugg2RHADs5wJjX9TExJ1POZ
         1Zxd1Lnq/WnDGLArdmM2G6W7ajfUDnhNYq3n6DuG44dhUyK0gmy0J4vO2Ujc0LWq8wYJ
         TOlDhpCJ/KN2+L3R1skiQy4WSzh2KcBZ2I79XPicOenulKxqmnuGUma93rsLJrGxFUb8
         hAk1jLQhGEELEQQ45b0JS03U0ArXCR68RyhMRYX9J6zoETJ5uhgYf4teuufJ7ZhqCtUK
         bDKxR76iKB3D/7hnnGS6TKToKnflBO3geoLKpYQ66Nya9beSFtEvjBe1l0KVdaH1Mt1w
         6Nqg==
X-Forwarded-Encrypted: i=1; AKwUvBymyMJg4e6vmRkNHAjqD/Iq1QNPz9BbQXFkpiflRq0w4RN+g9406k3hnJwBxq0ue7VsY2i8Rg==@lists.linux.dev
X-Gm-Message-State: AFuF++krJE7r7BpvcwALPUCz0Mi18wIvUk8kYCCHNiaY0LVmN34pnmZN
	PJusS1fS2Bk2peQeKtGBULkMTgwNcrIyDZo/8pqOu51iOh+hA+ZGbmbl9ZSTkqAwnOT6FTlaYsL
	PRynoRTFdlfO4RToIA9XpxLq3NBqj1ZnxVSvlB4UKQzS3Y/UIMw8KqSeD3WmFacxDgA==
X-Gm-Gg: AYBFou3TjqUSCc/NU7GPLK1reZiudFUZeypjjHMMNcCxALt2UJtrZeHEXOMELlhQ0GU
	bC8fOP44BYONX1V1NmGR/JEqNgoLBXgCfPFLkGkPlzGPsKc5yVb4kdNg/pDsjyzxombUQiGH4ry
	UkvQo0XdFgX0YfkC3VJG/RaB4Ju8MW4+v8BtlGE3c3kSDUptmlYndwWY3ixlkrknKCiW6krnaGP
	Y5s1Tw9uN80AvgI10mDAIPSX0ZRmLzDfp7dHs4N1/lhYcdFBgPRn2DjI+at6RTRclnZ5yoSuFhU
	mItyGMKDSKaWja+xsnCtjOGc/NKDAveni2Hu+0Avl5cBBWbyJTSDtt+a6r4ENNJZtRAULRDjNJE
	X4DgcOrJ1JZWmTJmN2JcDEg==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506289e0c.3.1789492828485;
        Tue, 15 Sep 2026 10:20:28 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr3506244e0c.3.1789492827984;
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d27ad36sm26023a12.21.2026.09.15.10.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:20:27 -0700 (PDT)
Message-ID: <e55093ff-0441-49f0-9d06-6c100c8107aa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:20:24 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] thunderbolt: Try reading host DROM from device
 tree first
To: Sven Peter <sven@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Joshua Peisach <jpeisach@ubuntu.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-7-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX6gztYXK4wvN9
 qWYukdM9Qnwr2swjNt3JDSPoHk3usRrjGC5N+mrxiEq4q/hXayJLGmOFoODePJL2fX+6Scj36Mm
 ALwmOPh3r9ZK3CYvIAMWuTnlYpnEcrc=
X-Proofpoint-GUID: bCXcvXcpfZUmjQY0Be2ksW42yn-dvBzg
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa97e5d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=fxJcL_dCAAAA:8 a=i--5ToJz1EgYGg6QIxYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: bCXcvXcpfZUmjQY0Be2ksW42yn-dvBzg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1MyBTYWx0ZWRfX4hbnNVnB5et2
 fCIfHxj3umLuALOTVaK7IHRIDsQFF7VISEByrZ4c9qfarOa0qaImB5bPLqNHodDkOkxwh7QtgNb
 +PvIe5JGP9O5wpz3jvi6m2cgqSBKJOLCHlEJNB3RkdV25aIn8+mvnYy4A+HXBDeSnH6dmsHq0dz
 rImRoVZaqDNzKGI+0Do46TV5T0ykLL/vIwF8x7E1hSr0cRej018yW2/GroIZFqjDvl1aLUN03St
 pkGsyZi9uinALT+u5UMsykqvEX6ZSBpc6Plg8o25PIfz5FW/SEwil9TYrILEjiAsbWZpbghKV1J
 BEuHwiqd9Ip3uwpiNij7e506A2k62LqcpI+xmuGUTjocA7NJnvOTb5mOZPDicGTnGn8eMe2Z9Eb
 euEeB/sewkZK7Itsrh9QP9JruHarcbMOQsehIG4z9eGouCQe/LSioWNVGPsryhYjjBJf0zj2hbZ
 CnsH3RUdKzUS6eyXrGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150253



On 9/6/26 8:36 PM, Sven Peter wrote:
> On Apple Silicon SoCs the DROM is provided by a device tree property.
> Try reading from that property first.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> ---

[...]

> +static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
> +{
> +	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
> +}

I don't know how prevalent this property is in your ecosystem right now,
but generally I believe this would be more fitting as a vendor-neutral
property.

Konrad
