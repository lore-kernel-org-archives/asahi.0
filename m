Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A12D47E6
	for <asahi@lists.linux.dev>; Fri, 28 Nov 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317449; cv=none; b=cFq/e+EZGWyeG20yVK5vnk6WUaxMF2wDqJsbrAKOv3T6ggvVdsi6X2QAs9LdSwNgCyGUEkLydJJhMNJCTVhW9+cVPRzfdrZXPpbEL9YSLRI/c6L8O20oh2tO63M5+Jp90hqc1TcxXXYSOZwvzr0K8q1QNGyux80DcJgVNpp/RDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317449; c=relaxed/simple;
	bh=BI6d5r9H0oVhcgY7hqM0ujL/0z2q9c72cR3/Pq4ycVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmgLqIqnefC/ZcKjdlRouSoVNOfpw0iAikiSDXGz+HmALhMV3zORaovJgt31Jt8ZRoamGMyKPBBveDSmVFEAU0IIbUiP4AupRy6CYSCjkWfKPq13OHbZVKJh0BAaqARwiSSthMZ84z5ZvAj7PhffuUaYz5Ap3JhTecLoFOAKm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/sQqZ1P; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/sQqZ1P"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429c8632fcbso993712f8f.1
        for <asahi@lists.linux.dev>; Fri, 28 Nov 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764317445; x=1764922245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=a/sQqZ1PWivvUrJ/yYYyLNizK/FnHQWLY3KbjKkc/TmZOnJv0An3Hw55G49M5Rkgjc
         4+DayuEVOPhOEChinHjFyKRkVjRqtSkgovvu2mHDPxHS7PmgFaJr/fkx0mimhla1arOJ
         QJdmgDH+uqqXqlF3pqWgm+SuXaJyQmIoZMX6bHl8fBdeDIERpXxwu29YHw1QaSxkjCcW
         Kfmh7l8SGdu77KPSoCPvojeR1r2IEEaAbSAEYtPvQnVNKEC9x3887PNAKiwLx5ywTu65
         V5UHQk1u+ANK//HNRldfWcP2oMTo9hVZ8sDPSmnjxGxmDFkGBIWAfcftiCYOQm+oHvqF
         x/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317445; x=1764922245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=BSD8C0pN74atgZrHCnZomC/W62lcMw2JBlT1vBGkYGLmyoMCD+IomtDX3s4CY5Q+ug
         CXfUBNI/rNEwD3J0/w5NwNm0/gk3YXPk5BPEHj3audAmoJ6sX3KJEOIbS+JzKlOSpjzs
         qPtQgh4W1ivQXYIHdqLKBmnQhA8I2f1ie5v925D6Jueay91ZZIIbypb7OpitaqL/p5A+
         PyPp2Y7QDrLkdPLmhk1lPiWRnzk/BRdwqAX0qMYRaXYH/ec+otip0/lIDxdStW/LIyYZ
         EhU8mFm0/TJWPwMCOW6Ccz3Ecfp3xwYVkWRVg1tF9KS/Kc5iVHXWCPNvDqCZXy160Ims
         S4zA==
X-Forwarded-Encrypted: i=1; AJvYcCWXTEYEQvKS5+aYzyS7mY9viIbe4ohQwPZMGn4a3s9NhBVkHvKiCxnkb1PeB6Ppd1oKNRnqJw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn8lOrRSmTKkTtB5zJQQI8JnAWGhYnDX9vgr+RZlG+b8hHXZej
	m0fRsCGqTIP8UlwhCbGkGdyHd23lccs3J0Empr3VjfeulsOSNljau1vn6/KIQ90a4Iw=
X-Gm-Gg: ASbGncu/x8ozFmMC4QHZPE4nXcpp/lGqLkWyFX82djnFBI4no8jY8mp++9nKo8oIKQP
	3paidyDCuUTJJLkYXdiH39Jio7jGySk4vrsdg3WSfoKYhe3xMla2axgpnHu84B+JPMH0zq8lo22
	Y1oa9nr3gGOyuMVWpYSJ/Inwo4xOfHu0gS2/1YoDT5GkUPg2AK6q1NslgVqJmmSzw8zw3P4qKjQ
	dhUCxsvRZLXalLWb9HodpP8AcM1jSHYx3aNc/P2j+o0ZlAsN0bKMMz7/kiqgnggbktV9xgkYTl4
	DIflfLMSuyl4flOaDNZITc99/hwmGJA5AQwKLdjBsnQnffnVUMPy5hkGbLyAZ6fWNtejBX5CKow
	kbgBpKtLdZ/CuMAqQKBOkVYr9MQQbUstgggk290GRqh0RBTsjnLaYTAp23p12MgSgw43MADaN63
	n08iDitN8Baxzuw2oz
X-Google-Smtp-Source: AGHT+IHVNGxLHdQSfNonRBBq78f347/I8I+ulkCPlaTONnGVXYiUFj038obXmFsDqBT8iAGXzvuP8A==
X-Received: by 2002:a05:600c:1d1d:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-477c01ec3f5mr247354265e9.33.1764317445111;
        Fri, 28 Nov 2025 00:10:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47911143bb6sm83247115e9.3.2025.11.28.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:10:43 -0800 (PST)
Date: Fri, 28 Nov 2025 11:10:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <aSlY_w-nXA38PrBO@stanley.mountain>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> +static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
> +					 struct device_node *hwmon_node)
> +{
> +	struct device_node *key_node __maybe_unused;

The for_each_child_of_node_with_prefix() macros declare key_node so this
declaration is never used so far as I can see.  I thought Sparse had a
warning where we declared shadow variables where two variables have the
same name but it doesn't complain here. #strange

> +	struct macsmc_hwmon_sensor *sensor;
> +	u32 n_current = 0, n_fan = 0, n_power = 0, n_temperature = 0, n_voltage = 0;
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
                                                       ^^^^^^^^

regards,
dan carpenter

> +		n_current++;
> +	}
> +
> +	if (n_current) {
> +		hwmon->curr.sensors = devm_kcalloc(hwmon->dev, n_current,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->curr.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
> +			sensor = &hwmon->curr.sensors[hwmon->curr.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_C_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_C_LABEL;
> +
> +				hwmon->curr.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +		n_fan++;
> +	}
> +
> +	if (n_fan) {
> +		hwmon->fan.fans = devm_kcalloc(hwmon->dev, n_fan,
> +					       sizeof(struct macsmc_hwmon_fan), GFP_KERNEL);
> +		if (!hwmon->fan.fans)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +			if (!macsmc_hwmon_create_fan(hwmon->dev, hwmon->smc, key_node,
> +						     &hwmon->fan.fans[hwmon->fan.count]))
> +				hwmon->fan.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +		n_power++;
> +	}
> +
> +	if (n_power) {
> +		hwmon->power.sensors = devm_kcalloc(hwmon->dev, n_power,
> +						    sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->power.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +			sensor = &hwmon->power.sensors[hwmon->power.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_P_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_P_LABEL;
> +
> +				hwmon->power.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +		n_temperature++;
> +	}
> +
> +	if (n_temperature) {
> +		hwmon->temp.sensors = devm_kcalloc(hwmon->dev, n_temperature,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->temp.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_T_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_T_LABEL;
> +
> +				hwmon->temp.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
> +		n_voltage++;
> +	}
> +
> +	if (n_voltage) {
> +		hwmon->volt.sensors = devm_kcalloc(hwmon->dev, n_voltage,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->volt.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_I_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_I_LABEL;
> +
> +				hwmon->volt.count++;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

