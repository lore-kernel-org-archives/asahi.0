Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=mFst4plDQTSq50mqR8xGsE+v3+1P5LPlmAw+jeQRD6idzSmm9Y7mQgKccIbaLWZFqVaL
	 D9IN1pBvPYbpTn51GD8z31LZ22rbEwtf4IieDOeNC9ITqZbQpRvcVFapooxo4xTNHa9cm
	 kWbDKf+VDSXFeiybVmywRTRYMoVAGEHxiPvBrKCPP01h/Uk3innhiw+xx5K2U+axd75HH
	 NGTReuuRqe8nOYeDo7vXMDEx730MtS3YMtnTAWGln3Vf96WmZ93OPOe+8zpn48QnI5NYy
	 dRwkOYzgdpJ9toxhfGPav4E1Um5EkLevY5r9QpZFrP2y7YbZlILx5GV8VQw/WoFBdmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=EA3Z7PwHu6PD3H8OqrmpmLysxt242Og/Gn1AtYxtapjkdfZySPxpQ4XEI4Z3UpwgFkbl
	 6fXmPRGbJ+hr3izdwvainftTq+BzBzfIhutYXMb36XXrGuqLEnjfVr8UnXH6ajZ6vXz1p
	 6L5JHp8PxswRZ52luH4kRPXwiL4pY7tfqs9sZ0CkTYvcCXajCudvQv3H9qjzkpKpTBloM
	 cIHqQRIthM+52p8El27s42QqqBvD08dHYQetSQfYlAcP5WPHj/LkzckNPfCa4kM+ovDQV
	 HYU35Gk0hsHpLfBLmvDgIOP5UhNCvDU90wSBMy+//sJVSsBkJPbCG3jjyptbvoTkwlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlRWWJ1w;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE65608B1D6
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE65608B1D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlRWWJ1w
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1adbf62dd31so1554459c88.0
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=wlRWWJ1wds/yHz4XozhhxrfJCtF09En1zcZOOhr7etPStEiIw6uAduzQep25NwFLxF
         +Ax4YvV54pHSgkdelW/zAWJC+GAjiP2RdEzwg3YidnCyWtVchrPsuAH6ZzwhX3zvqNpd
         pPVDrAm9TSi2ZnY+axVfDXsPIiYczEPRySyFYQC0+U+htbumvM2cohdJbmEaALuztX5N
         nfj4lYAa/UN2Htxq9wdKsncS8NtvQ0T4gustcBRlLsIgcpkoHAAd/PfKiFPuPDkiz24Z
         PnJvDhpRewILTgWLGTYQtEfDSgBw/LdXBdZGiME15pCxXAVcGb2o6+eTSw+fQr/S8f0V
         dIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=ecDXwLnufhEyb+uHbHc6Lh+gwDc7/CxpxwIIaNiA61GAtu6WrCv0Y+4Fu/3kDMofnQ
         7/C5Fc5XjDqe2Hwisg4DOSoYWhrKR93GVsLUqf65ZlpI1CbUYa8DQWllNSKHKL9PY4IV
         dYlD+A8R2E53CJIlEyyoPaYqxZ9jHdH3siWIOehUNfHHq/HEd5g8QieCwmXKgFZ8Tyw/
         ZhzkLFRyODZnLDYWyNJo8Z0fF5Qfgl0NYNXx0mRffUC8LIo5n1drWMOCv60lno4jlznE
         Z6Z/D7zyBrtE42zp23bxoySq9bQYy9y2wC5EMd9T7L9N/4tkIZoRM6eE18kfJx2bEhTG
         iDCw==
X-Forwarded-Encrypted: i=1; AKwUvBwHbKTgdtpEU0+DwbnYFeUqbWAfVzAxCXeqygdQWneqmZYjXeBZLoMCBND4pFeIRGpL8DXK3g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/OLJgDjwl911He2iPfD/JnUrlhT4k2ARYniHpwM6WG+4r4G0Dj
	bW/c7S7wt1vfXpF1upywutw7khlGnstOiRJhIfEdagwp/CFF87rUdog=
X-Gm-Gg: AYBFou2dWXd5JtpoCZU24z/TooGgEBMD9ttma3Xa9NfLwQSBnj1RBGGYLvHUM6t27WL
	XPjfpY3HPACH37tD/dib68JTCAzPThMQT+mtPYnHDTcggZiG1wQpQfYGdvHech58I0iHBZWpzmv
	JEfhpKJIgUt6N6rO12vRQ84MSDHATge+v7Jg2XeVho8UQ9CHJHxmNxyefpahAv7BiOQh6mekhI8
	Bdy6KnHZvJS3w2W3mZ/M4AAlFteih1qLlffNBPatqn/XtJwdafw6iFRdttRyenYR3Ofskd6Su7f
	AuIR22IwZM+uSEVq0m8mY6MMBptSwtXQuZVfTVLMb74x9mo7AAZDDDPH51/0tPBY1bsKeRVRNSg
	GUy+8mFTJcjf4lWUyvorbLGsUXrlMqtlVl7HUYX+ELMZEddSyNGvXwavG211lZDbWjEwoDts95R
	AOGE3dloReW2XkzTFESQCGAb3F1RHXgF7ZO4mqG/go0hGetlln8OPLOov2euzqbLOnMsyiF2H4X
	8sq8p48wc9e2Nk+FM/RXhLqctPNUtWGaUpk4Y5A9mQXPjX2xGebEA6eSLiz6c4YztwZ1opxmalf
	G43hV0kFknB5bGBtIc3BaZYhPv3UHSVJ6tqV0VdTP80wEu7JheRSnSTJs2u9UbtBgw==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
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
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
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

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.
