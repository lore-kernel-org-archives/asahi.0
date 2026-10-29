Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284789;
	b=1pWOTIQa4K/DSYjHIsfndxBVAeVA1bHi2gTfm+hsKWfil3FL4qDWOFe3YPh+hRt//8it
	 qA/1YBzIouXhjpPgMOe71JADw84Wk/JXseqLqX2olkZqyymFdtL9ximvq7H66UXp1ZEbn
	 1QFxOP5WKh97c4UYcGNE0ykXOUtLP4At2grPeYSZCF8SAUdpsOG8ypP2ox0WwsG6X8g+M
	 mAJCeGUQqvScTS1Y3F8OKySwk1N253QRWxq8GjFxl67JN0HkbuGjvvN5sj594l76FODco
	 xXoNbJvp7T2tGsUCh55NJxSRqwu8XLZ3x0+7tVReLqbyoX+w3Fq2DaIMLklgSp5YNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
	b=XFPg8k/tbX3h7GyfJle2TSmomRMoTDVFypPdD2hJIeSz/Lx6fdqMgL+YLzwbG0sYOUUs
	 Zywu7hKKrgChE4FhwWaNnZSHeTT3u+jffnsqdRb8BSJL1TWqPanUe2qe6mrVXe/eJNJte
	 /UOAF/+UdiNVc1hoJidOJLHfHdumaaIakDqm4wFj2Xq2MsA7x722N3TK/gtJ3fedLC2kP
	 PSrtHrINsVDShDbFlKAfbKaxEPObu34SSVlFjx/kf4x95+OLrojGBG7WBAtqOfnafkH/X
	 c/7jcLEFSvFucFwkwVbNre2a5IyW+AQANPfL6drPJJ9USGsiGao6mZz3vMZub/QYS5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXYdkjlN;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0B606A31C
	for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 14:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EXYdkjlN
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso1992546c88.1
        for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284788; x=1793889588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=EXYdkjlNqcgMFZO8rfzUyEUMOuQjVqw3ziZz8SeFpiO9+IopY1cHIR2WPH9iFzkTF5
         I6IAUjh3H7QuxblUnL0KmdRGYjnzafLa/SwcIp/CZmpN9beb66y4BrR3SvQEr22Ed/LE
         yqO9Npxrr5+hVx7uB/o1wUW/6GNRtWAMcm/iaB7LcZaD0o1R/jAI9zVF3jj5Pnn1Hxdt
         BOuUbKHYYGQDIWx/Wq2LurwjPdXGpWfhotZse0iM+Sf8qd46oT+LTpVB4x9s2x5Ee1Qt
         zZqO1FOdEaj9Dy/hVLreH/ZDXUq29uZDq+46G2lu5lJER+VIq3mh8Ah52EjWUFqptkri
         ayFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284788; x=1793889588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBDKsqEMUUI4osJISoF5o/4t2sYaPTTraFXlQxWlPBk=;
        b=T6995bo6lxX35EWep1dhiQhNinr3ylBOI5nX5DcMBElYwfT9vz+l1gEUQjl9HgIXd+
         0AxxCfn9V+dJCCgMosEXvfAp/8FKFy6VtStFidDLqadj8d2pim/jTdhgdMfv+QnZGczN
         wqDs7kQDalrEue1+nx6+/L/oUR0dzl9GZ9DpWQ7iY9M6CAfiSAzj52nyge6RcC4u+FX2
         ne5hPMT+IUqm+puzWjmIEVJ9VYVPIL4swL11Y3oAyVzc4mk3eBxP5usHGrtWbEAwTEi3
         QBFMLDG2xAPuVS0Z39HCeC4EVDRfBz2f1NpRKlNaIPKGg9FPzBORDsMW2Pq4Vedl7a0M
         sbNw==
X-Forwarded-Encrypted: i=1; AKwUvByOMIT9MLfdTPP3+y4eI5Wz71K6GUIaxw1kIIizqJizxK+ZaRoogAgpG+8s+6fR421Aeg7v8A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKhrv7Mi/x24GADx7MKfLymUvzx5mZ/S29Z7WyxjYMW+MURd0VS
	M/mSLGuzJUmXuNxl/7lG8VXoEXy9HX3ID3T/aq05oR+HrmdnE2Uqhu7e5Ogl
X-Gm-Gg: AYBFou03yoYxNe9llkD6ww+iRnvt6sev+9tMTY7uhBtdDoOKXHFQWogGg9SQzug5V4m
	2hjhq2imYJQD9FCblt4lvIaSfNNnqYnT2vbfjFVWspUxlmqWFzQ6aG9QTRpDlNxKIp3ynp/DpoA
	LAoyyS6jCrLNSb6fDX+p5wmZP+JDPOb0P4xHUHGxobU/B4edVumivGDr+nnKJG3UmZJ3MQgdepQ
	rpALDbqrqQKWXX2saOlsvDOlHcPjiP01yR+wqlWApSVaBtfVskI1tQEro1vMIxI1ML0QCHm/DIs
	rbz3EB943wa+f6UVKdmTreJovQ1A7jsX4ro1tvnUdPQXC0Gs5pWxHSbTVkoqMTX6tF2fs+cmvUI
	e4iZZ+qGFRtsEFMjse69CdtTfzgl+FnJVkRyhs0ApetaC70BRPTHRrRrcCvl3wCrAMCeEmiD2ys
	Xu10xMHFwmOKj1R7ml9JZR95aU635g3bzAEozdu/vHaU804jsHWD1Kq34YFyWeGt0sE9bv7KXKV
	1p7mEzvpN9aZsv0/BsYUqgxjApzV+5p4e8ajbYTJQF4XemIYbv9Z6FxQp9BZakGLScyu2RF5Won
	9MTORhZiZxAgpi7ZB13qqnu8UyUr5/v6Pu/GCrgHGpxzaA3FTDsNJdOrEHqvwRteauY=
X-Received: by 2002:a05:7022:ed07:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1a6ced8e7afmr7393000c88.29.1793284788293;
        Thu, 29 Oct 2026 07:39:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.115.216])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75cdd21c3sm15396439c88.4.2026.10.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:39:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: k@chaosmail.tech
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jic23@kernel.org,
	jmorris@namei.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Thu, 29 Oct 2026 10:39:26 -0400
Message-ID: <20261029143926.1246-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
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

> This should either be dropped from the series, or be hidden behind a
> `melt_my_mac`-style module flag, or switched to a whitelist approach.
> We do not know what keys will be introduced in new smc firmware
> versions, and there are already keys that should not be randomly poked
> at.

1. The patch is required, atleast on intel macs, as without writing GPU and CPU
	states to smc, the system gives PROCHOT signal under small load
	, and heats up a lot.

2. the smc dosent expose keys of nature that can physically damage the system
	it only exposes power/volt data, and the most you can poke is reboot
	keys and gpu/cpu p-states.

3. If a person is randomly touching keys, Its their problem and not ours.

4. There are a lot of things that can mess the system way more and permanently
	than smc (undervolting for example), but they are not safe guarded, why
	should this be then?
