Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261978;
	b=shAj3XRTy3oqFBjE4cjT0WwzGStw0ePEGYTiL/Q1FoGteHPZukWKniBxKsmpdDbYdwn8
	 RNNc0qGsLEjr1cLlphdWS7yeGC+5uuLQvucq31z+0ELd4G3xAiVxePfn6Ax3i0JFrOabh
	 Q7Qm3dMBg33i79OMskStaXtsoquL0lmRyc9Ekw5UkXRuDN3p0UYKXP88I3B3kSy2zfa+J
	 GTYBqG7lwamZ9zV5YkgAg5zbjUFhKJ8F4a56I7EjrE8SnJKOgCBWT4p1OH57T44b7DmVa
	 zK/kvIOZFEBp3MVIpr7FZJL5I5IDSbwgAHt48iEumf9aJo2vk/cuGvzNKon5gvLItuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261978;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vf5yNidlEa+rFU9C3BVI0MM4tRR53gAKOOYaK0pBN2o=;
	b=MLFBDd0bbpbQWMBG0SceiBa9SZYy7CdEXuXRvO0fAm6L/lBxWTgVu1Ij4nIpv7HtzLyO
	 R5dnQDwg1mAgXFOdhHTRZ56oRtNkE5AAY0/NR9bkr7iCOFPfv/27sSxtWkT9wbv7g3Z+q
	 EPfwV+oXAO++iOsot4kn49Pw0vlMg7CY4FOWwttZs1NmBo6LHmANtxHzy9oPf9aqXwLWo
	 juctp0vectJ+HkOtv66h8IEAX2BXXBuhiqbkmZ7cDnRYZZV4SHk+tD9fxBSGth1LlHJdK
	 cmfMVGQ/gOvjEPAy2+9esP28264DCF6Cd+fJTd7ZoU9PgMvknahAbzxeTyq+uunzN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=FV+bHprt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yhn56oJr;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB5606A331
	for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 11:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71AB5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=FV+bHprt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yhn56oJr
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 841CF7A033A
	for <asahi@lists.linux.dev>; Sat, 21 Nov 2026 06:52:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 21 Nov 2026 06:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795261975; x=1795348375; bh=Vf5yNidlEa
	+rFU9C3BVI0MM4tRR53gAKOOYaK0pBN2o=; b=FV+bHprtVjMGB2S8RcLRQNQDn9
	bZdh+OR7HG23Eg6iylzbnNjXbSLUhRtn7ZpFMYTx+R1bGmzxPc/sBDgE4qAeZuuT
	ljl7aatyY3m3OlDdDOOZ1HL6iBJPJPcIGcw+aEPg6pSzCZWjUqJ5FmGc0sIfQxqo
	/MgFJVLUyZhDpEp+JuttdPu218/+huqi/7VoVwxETi6JMzYZnuLYsDy5jdh0xKuA
	UyBLE2nZR5wiMJX7Aky4axoCdnsmJgBrFFSjogUefe4Aa6VRkrcjnbi718vC+4Is
	PxnUuY9PbiwvU6odlizUE/IKbTEFPICfYBFBFTUbm0jN+d9EtWJvX4NHqG2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795261975; x=1795348375; bh=Vf5yNidlEa+rFU9C3BVI0MM4tRR53gAKOOY
	aK0pBN2o=; b=yhn56oJrEzjDnsdu/l3J1BAmPI3UEVBkOImzk4xKA8wXJkRDMeZ
	pYiFZIoZM3BiUdrfz9rSGSi41D0lRDXnX+TzUpfI5Ehs0PuT36m0cyKdvl0zBODq
	HlRJFIg65GAHRkqATI2SvJ+7W8+C/5f72Jd/WAkIs1vePt9DXOB2ceBFGFrtOcI2
	MnXJ5neKdLu0uViuRuVM+GA27LfcZExBAjva4Mr7b9N7jJ8AOSAINYATvhLFEJft
	xv9yWyUaEa1ABsyMW+Ii1l+RZIF0gRszLx13ZsSitkrr2IdpF30VqswWVP5Sbcew
	vbGbJq2uLmoEe4VwGb8xFnPWuApfIG68uhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795261975; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:B5DCqhnsGwB3pRrqDVnb5B7t/HHCfqtL6QYsg6EeVBUZBw6
	hR/5I4Q0aVNa8GPeql740bBpwhyowxQE+8WdgyMVWmWpDTrcviBtHYArFYqT76WG
	w2NnOFt6ivqjervXwJiiRkbH2azGim6sLqqMThvpoVuHeRGxQcT5xY625bezjey/
	k4kt0Lf2fFD38sRiBfxO5cpjjzlhcc5ieHxFJSZqqlKu5KKwMQegIcoUjnWuXaTs
	flt/SF09MwAtldm/BhioDITWOuQVa/kfoa8oa7pMn0WOYJcNM0KDhT66x8EE46Ae
	VTwvas7kyMTlUoQSZyviL+ZjOMNaioJujRThsMA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PllbRkZUG5kqS11BHAzi7Gauwu+Tul1lkzhnOroHy78=:Y0U1brNihjDI0zmj+e0NOmljkQ36GWR80sjuK4SJP94=;
X-ME-Sender: <xms:FoYBazJb02vEQArLE73gHOfrJZHzcsyPLDR8-aJ9bW0whXi8H-abDg>
    <xme:FoYBa-uPlpFVaLJSweu7cjdQryecnK-EiDXSgMft03FZy7jO4W7PeNmpW66fktOQP
    JkDrGlsl4ZiEWMfn3xowHn6uxITulwg2-t7RJzbdl0rIxKA_RHjE4dO>
X-ME-Received: <xmr:FoYBa7Vzt9PGb-j7UxZI5KfnddKw7pD2eVpZzIF_GZnvXq5soKOUo5l-NCrEdTmv_2FU699ljWH0Bc6kKG99lbPWcfHHoSVYpTM>
X-ME-Proxy-Cause: dmFkZTFE/iCAR/qJY1Oq9ehUAbZRcRuEB44N0ZYXPZcCNO8pC2g2/wBbtOpAQuaTZgK70W
    xKLm/wK+/fyJtgak4tomAxv8Y1XuWiITTjpY3AoRg3NDOtWYO3dObYAw6kyZHnjShp4W1z
    W4Rd9w6lREJDTZKjD3qisRXJLAWNLrq0qqgqXRbPQuFhCUvdQ5aZulYouqamUdQ8TpZ38A
    rl9ZbOsdG3k+z+6rKgAhZwjCRyTO6+wD58HRvk1K8eVcqIoo5SMzei4hN7MTFp9DaLl/Bk
    h8k805wdD+QtvsCKbjHCsVTZRORR223mnvwPr6v90KvUks/A3YitkE4dKqLze7GYH2oosb
    cvWl3TuBkBYsbCkq0xVPV1CCUNTteQSKEoHskc9teXXYZfumL8NrtpxQzjAG37H24tLcIJ
    NuqQT780v7AgME+wMTQFtRtc8Qg1Fg/XKL4HaMLoNlR/8oMriOs9Upqck1DgLnqeRfuQox
    PLoZOkla0SBhI/Tn+ONfzTssWlS0TfebbkDrs1ghcG4fC+RnlfBaWWke4dYNAfIoYiAY0O
    lqwG9l4Eizche5BbFGeM3ED6Bd1pE0ep4bQI1wWWE4TBwiWTkIVcGbAOC2JAx45KROI1MJ
    rxSPMQQHmPqQbUDtY1m5VIFvzV2OcmqY6uswsP+4C7CGcwcTLBtNhYiXTuFg
X-ME-Proxy: <xmx:FoYBa5JBoEt1NktQEeUlTj9FZq8XE2-UE6Ohcb1cA38NPrZf4uedOQ>
    <xmx:FoYBaw-fDlEKUXoopB0j9KXJw81ZAYpajMN16WOWEZ4fKfac6TZcEg>
    <xmx:FoYBa3Nxeyl1RpGWqscv0oUkRP2LoCXYR0UbfTvIK--zfLtVgtQGag>
    <xmx:FoYBa827fFffiz8YY99o9dlC2yJqeBjNtF4yEH2Y08hPdX0OAgCqzw>
    <xmx:F4YBa4TAoJAFaTeVXe1PjjV-M9TcG19Jr5ZAok6slITaOqkhMTj9kJvc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Nov 2026 06:52:53 -0500 (EST)
Date: Sat, 21 Nov 2026 12:52:51 +0100
From: Janne Grunau <j@jannau.net>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yureka Lilian <yureka@cyberchaos.dev>
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add CPU frequency scaling and
 OPPs for M3 family
Message-ID: <20261121115251.GB515128@robin.jannau.net>
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com>

On Sat, Nov 21, 2026 at 11:42:45AM +0000, Michael Reeves via B4 Relay wrote:
> Hi folks,
> 
> This series adds CPU frequency scaling support, operating performance
> point tables, and asymmetric CPU capacity values for the following 
> Apple M3 family SoCs:
> 
> - T8122 (M3)
> - T6030 (M3 Pro)
> - T6031 / T6034 (M3 Max)
> 
> On T6032 (M3 Ultra), the cores on the first die inherit this support
> from M3 Max, however those on the second are not supported yet.

Please duplicate the values from die0 int6032.dtsi.

Janne
