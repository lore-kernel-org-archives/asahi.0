Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265786;
	b=yG2bblFOyee2T4zyIzf5LiSfPgg5xfLHSA7xfyrrK4WTyryJlgjOHCVKUecJgi1mM8ao
	 JsE/eGCM6sKR+pL+UIiFk4uG0rPoBye4Q9g/dKmN9laNzuDyU9IeBBsdYWhZo/agS6oWm
	 hY15T/e4sFSLTywx0eRWO9yAKxdQ7bp7k3qBu/+DwOipPwnY7rfENNrf9bZFyY0uqCqWy
	 +HplDKNRUIQ3wlI/jnX2mLRxq96Jir5QehWCwqMyPiVZwmcqnjf2eOgTJLrvxuxdABCyO
	 t0Fr97ClGAUe+pH9z/w0I/60MNjLnwlQ0NET34qkzHwFtdIHvro6wYrzMht/lePIDKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265786;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=tjfAbDDo8h+t2m7Oll5N9+sjj2zGWKROZ1OXhj5/7js=;
	b=KiPiZg1Jy69Qvc9ebbaTa4ikQC1b/jak/TYw7pMeejduJ3/QamV2F0bNGy+w3ay1RBCv
	 JhfMLdXFCLGuupwC72ZJ4xXlowSQGnje3NQOu2c+hvSZnAoh5ljwRzoUOJhuHoaTxi+3P
	 nA2EG9ku2xrlfeBpvgNuzJfWzmC+IvdrOzz6QpZe4ohhBC+FO+Nan17F0XDoBRJ+1jVMF
	 O8g/8q8WQqMWB4hVgyzzPnwAaF0+88EQFnBllkDmNYDAc7Hp6raTkrXcyFRoxwK77jOyc
	 6pJD9cNnS7ZtNsl3eCUrAojJFV9pNJ4NL4+m6y1WzzQPmcjdQ5404bxj9dr0Z2ZT2pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=yL2lDRgC;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB3606A322;
	Thu, 29 Oct 2026 09:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AB3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=yL2lDRgC
Received: by chaosmail.tech (Postfix) id 0122E1C87C3;
	Thu, 29 Oct 2026 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793265776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjfAbDDo8h+t2m7Oll5N9+sjj2zGWKROZ1OXhj5/7js=;
	b=yL2lDRgCJDJpaZDz8pZYltehrxUJx2mB+TmBFD943/OHPwTRwWms3JeGoZZCx75H9dN9TB
	U9YD8Ti7GkEr4GTe1Eao9vIg9GWutDjjVcKfHlF1Me/XLMdJEgAXiDGW7GzXlVJSwMVyYQ
	9XzUrTModweKsYsUaE6CyFELP3+Mng8=
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Subject: Re: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261029085504.3547-15-atharvatiwarilinuxdev@gmail.com>
Date: Thu, 29 Oct 2026 10:22:43 +0100
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Griffin Kroah-Hartman <griffin@kroah.com>,
 Hans de Goede <hansg@kernel.org>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <525E5B4D-A947-4567-9FCD-5FFF2CA8B161@chaosmail.tech>
References: <20261029085504.3547-1-atharvatiwarilinuxdev@gmail.com>
 <20261029085504.3547-15-atharvatiwarilinuxdev@gmail.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

On Oct 29, 2026, at 09:52, Atharva Tiwari =
<atharvatiwarilinuxdev@gmail.com> wrote:
>=20
> Add a /dev/smc device so userspace can talk to the SMC
> directly.=20

This should either be dropped from the series, or be hidden behind a
`melt_my_mac`-style module flag, or switched to a whitelist approach.
We do not know what keys will be introduced in new smc firmware
versions, and there are already keys that should not be randomly poked
at.


