Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714404;
	b=AfS2siplZEf56EC1R1PYYjdkJ49UQTzeJNE+sY/UHN+rtUwRAF8xMJRtN4f+6fLSEX2X
	 m6EbLglj8BEBi3fX/TEjZp1FwC5xDg0lEe0avq12UPJnOT6b99RTum5eErxoFwloKfu8N
	 qdd0cLSgxK5TYrnCtPNuGmC9nPatrxyuSX2zbzx7IpZksu9IBTEIyOO+zhKxe3i1ienqm
	 550S5SJ+WiSfeNEDcnV23U3MgoJ2RJwX2dfRWvewFSuSXMXEtm4KES9Ilo7ACxzveEwY8
	 w7a8nEF4SFuUhzFcYCsk+dNkjwTWB6qUm6stqfCa0YYlxVlMl7vcCYsBJZSyXZZW2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714404;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
	b=gI/XIaMmTqKK1NHm8aqcSHI6YrMvPeJWVvYAhW+m+jqMPX4tmLURrg7Q4qMX2GIMUzI3
	 SUerz1fg6rvY5c431SotO6ed4hoUEN3x+Gm9XJ1BHbtpCHu3C5keAiRzjbcj7M/gt8ekh
	 VTc7bGE1qcmUUZPSiXVEVa9R6jzS/c+kMQG8a4iaQilUWl9zUXIH4DM/uC7IPdDM2dfbe
	 pcUJCGjW/If8eIpJnyIAweutqRD/H+pvzWm1iXObA3qObcgjpFiXmmSsJ0WaRsbcSfX8R
	 0sJ2R39NlGgBqG6u+KWfXt0igFeurl859TdLEvcV7NnJ6G9bSXQ2u9icL+DG2KcS3Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WYcMd6rJ;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFA60850B4
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 14:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAFA60850B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WYcMd6rJ
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2717178a91.3
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714403; x=1794319203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=jwwYFWirdsq7jESCAMCi7BlnGhly41jGTQ7TAWrNK5Xa9Lb2sJUhBwYIbAUDB4chCf
         FIuOx/B0298C8wyl7G9TKZQmafpFU4pqsSz9f+RHGTQcJszcCVmCTa26GJrO4cpIWO4a
         G+eSaBh/GeHJ8XEmMVwu9qWVNjHmwRSO+OmqX86syu1xYbYf3xiWE0IyGanwRwRPHdjy
         6p9/RDjCRTpvK1e7K15oz1C/mcdnvw82+aP9Fwv4vTrJeU9jf7B6Hk3K9EE+f1AhbsPk
         nMnbocSRse3focGKw9JnByp7OV1OczryY1WuYDrehaVHkxR2lJTaq+HYXWhrz/JNOGC/
         dVlg==
X-Forwarded-Encrypted: i=1; AKwUvByD8e3i6u1frz+oUKEaiFBtLU+i3GWXDO4qVJ9Nu0HAWQa19k3aaWRuqdAV1cC4whUfkJ8jjA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AxtWtFSaLPjMfDUcP1ROymFruPGJ/6J4/yr6eKCQHsDCCH7zx
	OSkduNinBVQYxj5STNwOBhgq0o2KeMbb0XqR17Tpxrwb45Er4FaY3Z61MUFVU1fh8tYJIgHD5Pw
	CjV+RnBG/VeROHXIJTCVcXOBmX1hWvNc4RUeFJ4lI1ldXWOaiv2D+lmWgggdxchbWbbASCYFPfE
	AxMIUi/+i90xUXFRFGZIcOwRckYLLXfLgTi7jRR/RN/4k/NqHvXYSiPmafEXjhoVtAMg0xmVgRr
	rmauNnakxdi1peJ
X-Gm-Gg: AYBFou1XZ2lPEOY+fDJ8YDJckOCQVAdplH495hwNiCpeDxUdnOXIPIjh6IDnBagJiyU
	eSmPg4xZGF4A87QeTr0uMFIi/dKTOskrZQJBd1ni+lheBFR5BOZvBQ+RkCI25ESAx7+NCzIAVwZ
	0j97xKuKkAIBgzCtGZXRSEyX3dgfPblnuwIncOoiGoEDcsTCqPGaQGVhVhWYEE+Gzm++ED2HSD4
	ib1qTrf87f3D+dKRCxavgQnxjggOFSD3JFhPiuNJor7sc4ylIqcI9U76Adg90CpNRwlNgluKZun
	cdRTrvBZ5IyCSfYu1hfDS16JUuNOh+seNWn7RUXE+L0i7yvEmnxbx3LaWRFduE+Y5l84Z+eluMo
	SUvU1UrQD8pLMnDS7K85bCScAFp4lQ3DKlcowz3PFmJNzRhEO0BvwUZ1t493jl5aU29d4C+AczK
	tuN+8PuRw8LcTrzWOaLNUv1RFTmVerlw68dBeB/HQ=
X-Received: by 2002:a17:90b:4cd0:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3ae895a5680mr11008093a91.3.1793714403202;
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c8ad90csm1991887a91.6.2026.11.03.06.00.02
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:00:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso2140047c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714401; x=1794319201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw4Aw0jcq5gAZzmvQPuYkoKDSkJMWpxQEuocOLkzgts=;
        b=WYcMd6rJ/lXVWzIWLcr7DWz//nOkdO57W0gkpbkKb+oo7Qvi6nN15Gyee5peSNIVz0
         nIx3f2i3VEehRvqyWdOQvXYvPy1/DPMlMeVmS6flRcW9cfro8QK+6y6XNXyoFYVqc+8G
         d2omBSAz4ewlXtg5BFKm9PREOqIW69hduTo60=
X-Forwarded-Encrypted: i=1; AKwUvBwkosQe+aMgK9dKkjKpqvFvUsgPvz78tZa/qooeKpQtdaGGbdAYDj8BRK8bOOOr6IzRh8V9FA==@lists.linux.dev
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495789c88.23.1793714401190;
        Tue, 03 Nov 2026 06:00:01 -0800 (PST)
X-Received: by 2002:a05:7022:c43:b0:1ae:b906:7733 with SMTP id a92af1059eb24-1aeb9067966mr14495751c88.23.1793714400382;
        Tue, 03 Nov 2026 06:00:00 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:59 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 12/13] wifi: brcmfmac: Handle extended PMK command payloads
Date: Tue,  3 Nov 2026 14:58:56 +0100
Message-ID: <20261103135856.3676311-13-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-12-b5cbc2cde2fb@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:47 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware rejects the legacy BRCMF_C_SET_WSEC_PMK payload despite
> advertising firmware supplicant support.
>
> Add the extended PMK layout. Try the legacy payload first when the key
> fits, and retry with the extended layout only after -EBADE. Use the
> extended layout directly for larger keys and reject keys that exceed its
> capacity.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 39 ++++++++++++++++------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 18 ++++++++++
>  2 files changed, 46 insertions(+), 11 deletions(-)
