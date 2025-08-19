Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6CA2773FA
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607803; cv=none; b=JMZ4xz57wy3oCdRSc0SBU/IMa6Hkk4yEkM3U3p6LfIkCyXjDRgL0yNkYtqgmLlgFB5fGwREyaA/xFgGCA2BD0EB6JfKGqz1Sr2OPSiZtBnHXkm4YtoFEogHgJBMKOtsNx0yIpIVj/2aUqSEClvPAfwKUQsmqPOF3xr9SF+U2iSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607803; c=relaxed/simple;
	bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggdRQ/V3SjHD0CDxTzzoM1aYHOv9QQwo+gVIjy/hEz68LdbsznBhFqw+biiOXcmFt+bRlP0gVEZ20Ti96XiTSyYHqOq9zgqef7jAybTGJdSBIioNnDNH+Kr3W1LEhpc3uDS6lqSBd+wSkSpR13JC40Sz1RsX6BPApQyulgh6G7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhEb8yH5; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhEb8yH5"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e94ee2f1fe2so273300276.1
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 05:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755607801; x=1756212601; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=MhEb8yH5I82p0TrcgQv+KHugelPqo8uGINxqltf+am6VvcyOrRLnqs7onq0L7vkwPr
         C+WFb6FwDlXJXhTz3KEHM1K4WDKqvF/rR7XvBBb1WrjipWhNOIzmI3kzKFD9Tx22qXpc
         zmiFWOmANxm06ltr8jG6f9LBlCMPJ7GY4EeX/2gkNBEarfI1HVf9X4+Wph/0TIhK9dax
         l7ikbnqmGvVIMQO+vFbFpGo/RaE7JuLetabcdb0rk1cotgGKldGxIbkbSrhNoIHlqt7q
         cUwqGCR6CaHed/Dj8bTzMmn073Y7Rs40kFNmbNi3ck96yfx/y/trGS5BqPzqesdQgoCs
         OnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607801; x=1756212601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/m1LY6xfwm2u+s4duiA5oQcykTMbM962zM/dxGBy3Y=;
        b=YBmS1ez4s5w85Wd4qZxS74paqjIKIjukug01nZP+/SlRd/TUHv5uHmJ4DxAWmb8yIu
         aHPwdl0GaVINOwXTs1SNY95e4QJ20PVV1WLMP+qTzs+fYIDyxIMsNhgDpwQ2N79JzgIX
         8zRfCXOAlh2G1dD+3pGQZxXPaWCUKMJMX9XqqJwyYuTs8bceIGMxuVoZxHmvFzNfbnNA
         7KL6Pk1UGbkuZnjBUaV0tr0XtryVqWcizkgqE8BSS8jhZeVzO+iN7crMoCpm7w5RVMI4
         RNeI1w9ph7h+rnomAcIPmTGCTQt6kuG+nN3rfnFoK6u7lY9xp07+pHxUZrczggN2qn/Z
         9Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCXhHeozEVXOPqaW8OrfJDkLUOagSQoeQ9ihbY+yy3NGaD9vaSkvRGvo5MpMt0CuNVugmJq/VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKCYj/J/Z84tNzjfBJMxtj3qERN8rE5fku99uEoTrlPD05iXkg
	uU9ruGyMs1hCIMon+z/x4eu9V2aH0lcxxPHgdvKyKQvKu2Rap9f0PsUq2lOr3AQ7FpDYu8kExr4
	qYR0RLUQLX3dgfogHXNkRbqiciyjlIUM=
X-Gm-Gg: ASbGncvuETjEnLTuYWbTLYFg9qlQhHxvT0sUDIRlsItx3VHLkmlpONFdCRsF0RIokuW
	em3fUyqKf/of3NLGYlRK9SEyzh3zpTzoG8OrUEDjezi9N2HJmS7RD6Nzo+MO4q4lJkt+AoEEFxT
	euuJGbKXmm8EkYOgEHX75pIXFzZZ4S6+jC0BT7bG+uybY9v2kD4ww9i6kWBhNX0N0rFZbNOzEHC
	4EVBwmT6L2Qj3Ni9l5aIaLVlqXIbQ==
X-Google-Smtp-Source: AGHT+IH1h+BxKBN05pHvmSdWJ4xJ7m/5SogwxucTQGgwiqZY0kchIq341vqJ9PFqt91EW03TMyusPsdeBGu0IIfihnA=
X-Received: by 2002:a05:6902:330e:b0:e93:2cea:b3f6 with SMTP id
 3f1490d57ef6-e94e630dad3mr2829156276.43.1755607800721; Tue, 19 Aug 2025
 05:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com> <20250819123505.GC7508@google.com>
In-Reply-To: <20250819123505.GC7508@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 19 Aug 2025 14:49:49 +0200
X-Gm-Features: Ac12FXzpOXpP5YWbSOcVjUpbhP2SuxCAjsf5aVyKzjKV0kcqir3rI2XCSKPBx60
Message-ID: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple Mac
 SMC buttons/lid
To: Lee Jones <lee@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> Separate patch please.
>

Per the discussion in the thread linked from the cover letter, the dt
maintainers have requested the bindings for all subdevices to be added
together. Do you want a separate series with just the dt bindings and dts
changes and the actual drivers in separate series or how do you prefer it?
