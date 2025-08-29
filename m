Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CDC283FD4
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465892; cv=none; b=Po9+NBj4EOlwRitNWUyyej56O//qiLXl2IwWfkE82X04OqHQ5dUcTnY820DvLo+oz8goN4pIOlPSXY11SHvKbBr25+Q2yjcxcI1oNHlsY8Cec8bqokcNkD7JMM+cbJ15Wp91yMcC3n2rq0+xbTAS5OGb/vdm8UOtFWeJsC1BGjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465892; c=relaxed/simple;
	bh=GrchNdWYzgpQWMdULTh27jCHo9UrMJz3lOa3PgY0Ixk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRXqHvZl/ZVHG9QvQJOqqW+FH5iE0KNFSMk9KdjPDyyGQDMhNo+0ZELVKu0MJ4NpvZp2GsA/BZzjjneH5mzZgCZWrKqijYich0sDKNOqsvoUzXKAU+nIOPyHknbjIeD/Cka6loGofDJj5K+PxFsdWVzxL8Lgiv2Bk81zvaMg0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BempRe1Z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BempRe1Z"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3d0dd9c9229so343180f8f.1
        for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465888; x=1757070688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=BempRe1ZO56J4EQxfvxYvJX4N5ynt1qcD+GtSbytoKrDlLCUzq7V3KJBAwoaf7/RCg
         3sPN4MBdsy4fb7MbfKi1p27v1CSvFzh7vuWlqIOhI4BIrkRoVuxbnkbAPqqV9wIU9zS1
         1ja+U01IFDSR6Tvc+DaLQu0cGhxfOxwnf5K5GnGdq7CSh8urq0GqwSBxxmcx6QyN3Q9Z
         l4CHglAtmPuf+o656KWbUb2pTW7XAB2yDB1/X2svuJKKBTAwShZe5lpkx10KwRvuB5FQ
         TUkIB9CvVn8Q/2+sbSYx8a3qI2i5wR9aWD0E4BRxpGVFvChSE90vbkN5WH/uG96QXhX0
         xrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465888; x=1757070688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=sxqA8OUYvCHTasBrj+GqaMxBVGlvmRIMMpdlLqxOonHHJvLMAVQOZHp1Eam2Zd66Di
         fm2FobxN9jZaKv0kiSPWNWyGg2pDwEzQUGifawbUGkoW327epRGIk53VZK47bBRmGEf1
         AmZRvLGELoH7ThWqASwZjpTMiqkxIYdXSW6UdFBd3wrpQiiYV7EG5exnTYCoe+PbXe4j
         M8Hk4PwyYxfiPLYqS5ms45uWzTr0XPvzllgiXW/7uACYpfMt8slDeW4NlWFEqjVXzMdW
         y0J4o2/nPDYDvQd9JDmkk0g92MWunZV0kvEJftkKrIVvH/FghXU2NKplEnYcH/LP6zx8
         0XTg==
X-Forwarded-Encrypted: i=1; AJvYcCVEbZyqppBvtmFJtfCRDKyOzx29XE83JT9Wot2mitUC4HoDe+Jh4eMOEfPQeohHRbsBJRgBJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ymJmgRjiU+qvvj3SoXK0i+PPAGIsIrEOwptUzOFXj2MdhuKq
	8pjRTZhNQkdv5/MW4rzd/C1ezhxNRrBNAAb3Pl5x5FOe0/E0kqwww4XN
X-Gm-Gg: ASbGncvd1RX+Xm/bgrXVKj5sQTPuSnpC2MIcPqNMxRm8j+QNnBZpSDPE0VK15eVymMi
	UD8VHt2bxko7aR4lLG+AzC7etlb9V5SrgbbaYH+iLY5nW7GuImf/Fz1uhPOtbgp6pBJUolHDpOl
	1oUruvn9mymw6Y9KpzmXuBsovUAJ9enLepjbshGmKfnqyxJeMR6NSDMk0J8CaY8CY4XpMy9tlcB
	Z6vIXupz00MByYjZ1jPo50Hb/MzRC+kbkoTbK5QtvNICf96xwX/Fb+xUqoL0mxDxLLeGPtnEn+n
	J3lJvQSXtFgJMKhGdXjdONEzFEwu/+fAfGzYSi2lTOsVJyDik7Htp+9Bs5mz2eezO8lCr7BlME8
	KsCMrsvIOYkQnBHonzMvY83iKuYIdrm34YdtjTfPIV2rt+g==
X-Google-Smtp-Source: AGHT+IEhgsyB+xV4naRe7U+vGBG91GNLDzqLCMMGY7f5dp8nau5ERArTK4tcf5uChYU0pp1hjF9bJA==
X-Received: by 2002:a05:6000:2307:b0:3d0:ebf6:90d2 with SMTP id ffacd0b85a97d-3d0ebf69376mr1035051f8f.43.1756465887932;
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Received: from google.com (brn-rj-tbond06.sa.cz. [185.94.55.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbe7dsm2929064f8f.9.2025.08.29.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:11:22 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>

Hi James,

On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
> +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		if (smchid->wakeup_mode) {
> +			if (state)
> +				pm_wakeup_hard_event(smchid->dev);
> +		} else {
> +			input_report_key(smchid->input, KEY_POWER, state);
> +			input_sync(smchid->input);
> +		}

I believe you should be using pm_wakeup_event() in all cases so that
pressing power would interrupt suspend even if resume() handler has not
been run yet. Also I do not think suppressing KEY_POWER is needed.
Userspace should be smart and decide whether to shutdown the system or
not when receiving KEY_POWER depending on the overall system state.

...
> +
> +static int macsmc_hid_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hid *smchid;
> +	bool have_lid, have_power;
> +	int ret;

	int error;

> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
> +	if (!smchid)
> +		return -ENOMEM;
> +
> +	smchid->dev = &pdev->dev;
> +	smchid->smc = smc;
> +	platform_set_drvdata(pdev, smchid);
> +
> +	smchid->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smchid->input)
> +		return -ENOMEM;
> +
> +	smchid->input->phys = "macsmc-hid (0)";
> +	smchid->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smchid->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
> +
> +	ret = input_register_device(smchid->input);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smchid->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smchid->input, KEY_POWER, val & 1);
> +	}

Since you are doing this to seed initial switch/button state I would do
this before registering input device (this is safe to do so).

Thanks.

-- 
Dmitry
