Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=PHLfOl5KOBmEJRw29bYaP9OrEGhc7F9H1zTLxzsJ1/wf8V2oAYTDY+Hk/QMzQfeDU+jq
	 LVlkgXn0rZoX+SkvByKbJFIa21TvSOWw3hspoT41hxxhnaMD8bISuKtNvVxWazp6wwnKp
	 gqXGQNIIYLbuBd6pCbcFQfbXwC6UWNgKa+POp872WTxgj8STuFQxayyGLdVT9zA9TYXm3
	 FqcZvRDXaewxPxzzTve2Akoia6mqvMvbVlk+GsGa8tfBNNP18l0aHJ3KMHkYlr4335+vN
	 +M0c5lDSGhP2c6GzwmSl5rI2d8HPGXG0w8dB5OS9ahdw4J/q+Up7lT8jGkyfmREPpIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=OOsr9hpLZUS2rfUqXl22BmUCpFoDqFn/SIJE5YsgfHG2mSCWPGKHFRozwmhW0+yX8c5T
	 /7moeNX5ZZ63nWpgB7HSWeNgQop7Aib/wy/jUuLpwNA6mVZHYpIiGvFJGnVQOr4zeHaPa
	 Sdu7n6Iq+4Z1sxxKUoUHjmYOr+AMERdP/r9iOmBj4hQFtOFyBL38tZDtF837NvO3pn4CF
	 WDS5OtjspRdxcVbpRZ1WzxIF4tss9He+Yt79qdRe6cSH8nur+ny+tTEKFA7gxuSsFnddW
	 /Eobjfj7rKX6k3vJUMQB/x/5UnKB0HHzTYmASWazwRGNiiiMnE9iBZxCdkdIqNKV3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIxcJtgu;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAB160960A4
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAB160960A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIxcJtgu
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943048c88.0
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=PIxcJtgujc2omTmmbQjSDoiHGfibpo5iTiDjqZbbLBGHAB5QPvzxnncTOTq5PX1+Yd
         x4vGoaOgDd2rNFGsHvVTl7IgKbIrXQI5iOayHzfdN/6nNULDP9+dM8ILLKhvmO1AP7Xm
         G6lxwhLp0IWaGRXlPWRp+d8DkJwCfOZ/XDlEowJtn6kTEaoR2SROIQx/NPGJmwVBzBCv
         zSql93lPV3VHrUMbwCfTA5fg0pcx3YBTcZ9qGn4n86jok9uEmkaRa8CkMQAePQ3mDPLo
         v2gbGJRm2wdbZOAUiwf2Z/nnqIavSTrUj/yfxtochzqTJDxb8+5HMmw56YYkJfumq0Zv
         eJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=KeNIKuNJrD6KLbArJlt2mMr3sMzj05JRPzUcL57913RKBa2mAdUQsJAAjvahMHbH1v
         PmCZsev6x1MP2Wvh2FGS9X/hla7vNfci4tIRMpQ5+iQTJ7AGwDNcFXkK8RwaUHHPQ93L
         IYPTLd1gcRVQEwvAY0/lR/ahOUbLg7bB/M7N062l2kdEB7A/K6xy8/N/TEpzh8/bGQ6b
         v8PInjRMzzo0dnfKbqK8ey+c9lCvkleUWq6p5K6LaNtfFWH1cfZamRDGGn5jtgGqsGNC
         YQy+oZPhcv4dmqy/Gzwicg/yqfjgGz3OXj/hrzpbAn/pgpOnNdsEPzp3/PM1KEDuDn0C
         a4BA==
X-Forwarded-Encrypted: i=1; AKwUvBzbYnPkA+Xx+IP2eztsvzubPUrUTqYhRvzI8b9ZdsVlRYn5pxRAK1GTdU6zSk163QT6Nlcsaw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xlVfVQJlXd5nr3dSBrcojsbTCUWrfoZu3ffg/L/oaNAQdZOW2
	IuP5fPiRkgzSJFV2rD4XY338S/QkRbAKhLBal8WsAyGz2q4MsPRR6z8=
X-Gm-Gg: AYBFou2Xd3DD4Wx+lDZa3qe1T4/KMtDZHLkxQWVaItqppGEHHAjAYWTASkJYVMZohPg
	371XUBsDrsvYbTwLmiAkd9ahhaCh5vP7U7iolOtjMQDGtqJO0HX9ijwThYXTM5PL5W0kIFKNXCa
	g6Uyoz7LQH1OsA/2w9oGCSsTT5Nt+7dEmxsLQRX/XTXaiDCr0x9Rbskivmq5pDVyDWZSryzB2P3
	R63Fz6a6b3aU4t7ei9LM7y3349VYVIlEfsFvfjk4euVZphMzmSqJKhGpr7DN/LkMrJCXIl0I6hT
	2AtHS2McZQg06QTvy+FO0Vg3BCsQGenXguewOpFh/IzBs2QqO15IcqbHDCcMZd3Lt04gctuFC9w
	eeaq2G1uhwog5TQxRTSfJuzz/S40EsaFOuyjtO+yoNPfRtIFndY5O/NAUwaHENbwpWrfwWF7bw6
	baSI8hF0d4eqOdGLgD4kYy9apM8J49ctDKClouj3Ovau0VWzACSfYJh6gQlMz0bLwe2JR/1pqgU
	Qq0mlhgkQ6v2hNxL991VLD3friA3dKEK3Mokj62BC2Q4nx4ghWbWI9tlzqYhi/TmKzmGgDembyw
	6HUtRsBBBGsxxlbi1eX1dFv2GvCmcd08HVVSYT5CmtqapaK6q7nUAfsAGyaA6PCY
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
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
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
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
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
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

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.
