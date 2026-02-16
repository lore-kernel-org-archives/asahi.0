Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA54313E10
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253908; cv=none; b=ivg2ExCgohyRv4I94IPl5g1QFaG42mzpT/f2nJ/M27LbU8Y0us/Y0INCJNksOGkrzpWW4dch69K9AoXE7ryjzZIU823BqSWrWacAd3ODmoQnEwYRFRNmqK35ElGCHqt9hnIvmTeMtAjtCRmkXC0LoB6pkRkrCVl8A3eWeLWRa+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253908; c=relaxed/simple;
	bh=V2n4xk4W2jjqKrl5B1zT4nsHQzGtCeellUOtxdG6L1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrNI8Vob5d5fFxfUYs2bTp1LxsE1H4FLAMTzveECHWb2dy1IbpG4CLFL7hXlbfkvFZFOaqZ7tTkUoHGIbilWA8E0bKjgQ9x6zT6C4arZ4IbBLD2lVJvCywzuQXunt3YJcWgYierTox/pbHOwQLyOmjdxz+hy/A5Tezh6/nUI7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDCUIQJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+3xtRP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDCUIQJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+3xtRP2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBYQp73788323
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TlPKEBv6IQ2bElkuTOfHR7LP
	ZVbnNS4TJYo62QJXTrk=; b=gDCUIQJHDvPmPLc2Qo8VfZ7mqC/TUf6wxVzRXB5A
	yS1HtSTB8Y3Tn4oLkg/37nM6zp93QE/WFRS+bJpBVlRVRkL+N67aafT0VS1TFrqe
	N7fgir1bkG2RMX1L7d3YPPTlt6I639iaI18YSxadXX/FO+OW7GEySUv2peuSEbFe
	+fV0xQzOXEbOqyXUMKUZsYFuXx1b4jFY4nqLv1nwhSJZIuJpmCCwnKXEyCKskjWj
	njdAjvHg17/MXVhHCQRboAhQP+K5Ji0OCy9pTIGZjkClHQQVViLRRyPo3eToEsG1
	ChClK87FopGK7H7uiuDw+wO2NL8kyh6O+gNuL4h2EEMHeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24cx2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 14:58:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so1897177185a.3
        for <asahi@lists.linux.dev>; Mon, 16 Feb 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771253906; x=1771858706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=B+3xtRP2COSE5fHQvgZf74lS18uvkvn4hI3kQRuD/Bj8XEvTlGwzJHgeKhOT0klccI
         R/Nf3+sWjO537F+P9AFRtFoaG43Q7PBau1mwgWwfY9XMVVmDZ1VJE+fqcuLt6slKLh6A
         wlQ6nQKduUyp4nvSm518Dz+bzto8nu3uK+2epEPFz1dlDe/cwFrhHeiOaZvoJeZvt6lV
         9SCayzO3Z9iaxr0AFu34MmZsbEW2QjjfHADMTe8peu8efR0WR2a/I69lSIPulmea528L
         /QWCGwO7ixueTbNKfXRz0Sl4IeWx1wSrdxpPfodVJAL9AXeUcDdEkkbFioiCCqUCV0j2
         Jzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771253906; x=1771858706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlPKEBv6IQ2bElkuTOfHR7LPZVbnNS4TJYo62QJXTrk=;
        b=v9mQDEuy9cjbss+khQIc+t7FwDesJl+7WZ265nYKqlvZ5StsAOnApKyKnlnWLbROL/
         j5muOOhYIZh3kzCSw1Fh0LEe3PWlCwenZJ2OS8icQPhRPpCPqs/wTGdRrIX6IQa3f2IE
         GDt4iLGn+IRI9FcPBbDE+zjyxmTDeB6ZJJf+Wab7RjGztgWgkI7Q3QjOcdMnzKMJn85K
         2PZ5ReoKiG9HkXIJy/FUT8N5OmYfX4DArKPG166NE+LK8kO4j4NmwOHKoU+suZjVXy+h
         32C6eXH1x9L3KB75apKkKnzhhehnxj0xYcknTCHjA76GNZ4zDJcAJr5X/tsUQ5+4eH9F
         ZN+w==
X-Forwarded-Encrypted: i=1; AJvYcCXcaDxdWFPmPHv4owdLeTcvqAXMeJWERgDu6fYjNvSFIiOZLWGeCEpXRHiK1MRfxqwTK/sUEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8T8CZCdzrKR1xsjbv3P1Lgm+fMOivG0nF8PsgH+OqWqC+Qz0r
	+wWMPhzx9p/kMjmtNUdQpjEWoZLhY6YbwWdB3YwveBnJkzgG4buJL8yFnTaVgRKedzQ1+ilz1kH
	g5Y/eaXBgO0Cjsdek+PgIi3FyJJP+Ggs59IeGw/R3RU7GBdtj4RP3C2UzuA==
X-Gm-Gg: AZuq6aIHO42ULAC+n5hVJpS4qTfyg8VeUZ9zuY+oAePg3DiSUH2d3yU0UfKOK6kmP+2
	B/ey+IaMrCuHKO+0gRxJNJMGZXCI28SWHPUpsme6Q2JzlJT8hpGp06bLfhO4ZzyReKS6zEY+Gqx
	1BdCJmoYXgEDpsv5W+xStpP1qPstDAIxdVB7VgyZ/D+a0q6xZ8va/3EsutP2P052aEjkHJp5w6B
	j86W0+iJofKWPzUvPIJMfntv5jWgCCmWDpDG5KD/NXLYGy/mvh4BJFRRs1y6gZoAYrw5UbtmZlA
	RCZyAagK+bZylY6KXQceohDl5Hgnhx5War2g41oADj/BmrkQ8/S/eGKN3stACGkMaXFQcM7aSBI
	hirpZvgC/OB+jjE4EgIT7pPS3OAwqKb2qgH5X
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237439585a.40.1771253905467;
        Mon, 16 Feb 2026 06:58:25 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8ca:2cf9:819a with SMTP id af79cd13be357-8cb423c2ea5mr1237435585a.40.1771253904844;
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm32479964f8f.18.2026.02.16.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:58:24 -0800 (PST)
Date: Mon, 16 Feb 2026 16:58:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
Message-ID: <5k5i7zpr7y2wa5o2odkfyafhoiqk3ch53mwxt24g5thft3htxf@zxz5u2hobcmp>
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: s9HA2mXQuqRpvMx-3i1KLcI7bsQDegEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEyNyBTYWx0ZWRfX7ew+YJ5Eujyk
 vRWkLHg+YOVlA+Wg6Fd2toFIGuiClhBG1TXvQ7H7x/W90NZ8IHANJ6RQdZQR+QA6ZS18XMGRU4Q
 ZHmYpHpm0BT+RE45HDL1ysMvyte7yZxUxJ0GnC6JP5zkuMQf9xoO+Vb7kmCALXMf5sQKM+mj3ZH
 BcqKkTG468BrbF9c3DmIqH6Cf4dZxul7D0QVKn+r3fJvwMqB8IfrVoB8ddjCnENkOLOLKZC5z0G
 43b2SYot3JFGVL3+dbD9e7FLsu0y6I0zwlvSD7zZYm4IhkH63xThGnGb5rQ9RaRhlxGOMRInace
 dadWs1c/hxQyYZYIpCJHgC52mWxZV6cUgiP7Ynlt+ubCc/v4uAqW1Mz2Io3jm+68mhQFD29G4+R
 GbpXS7atas9GbQqnDO4e9F1ixRVVzBQKvt1MDL84ZMEFxR+9Jq5Y6i5ffqEeRvCEb2J6EUxtDSG
 IGRZopciV3j6ipdu3Cg==
X-Proofpoint-ORIG-GUID: s9HA2mXQuqRpvMx-3i1KLcI7bsQDegEb
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69933092 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160127

On 26-02-16 12:04:16, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
