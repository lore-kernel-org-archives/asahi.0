Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469E3009E9
	for <asahi@lists.linux.dev>; Mon, 17 Nov 2025 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406054; cv=none; b=X3Vd3u7O7FGJadVicz/vhwM60BgUdOmJKAuKJ8cu9NMv+cS42hi3R34Cw1i/zugKM9AZwGHWNpFAogW9PhdYssDSQ69Kojpg8HFRINxKTXyKV39ctxlCjGNmdP7Cgp6KLeLWME+LaTuVEU2azQJpI68gxvM+gd4SWb+ktD1w+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406054; c=relaxed/simple;
	bh=9LwQ8cgiBx+GR9gi4Ze2NRYHzMsmpVYF+u+bBwx5cCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBSjh8mEy+YV7055T8gGxBuXku7D4cIBHZR1UHMpIRv2du3ZHSGxNg3AtiKIZacUVK2zmN/5jwzjKMaWMqtTydd1ZeK7i8CQKAmebCc5B8+P6MlAn+gbXJyMyv+0i77gx7odKT3GASFNfrTF47TdYEwbsnvtcSQ8KOlHNPILmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/csKNSL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/csKNSL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29844c68068so46185185ad.2
        for <asahi@lists.linux.dev>; Mon, 17 Nov 2025 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406052; x=1764010852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=f/csKNSL4vDuR8YJp2cN8ki4IuJPTMlqsCY+fK8Ph7X/zIFO0j64AzHScw/5rluGuF
         Qx8CyC50z+BKBXEp1cWJ/LDZgKCU2aMtjAIJ/UAx/EF3MGALp4gvF4bdsioGuX4ImL6A
         sWcXv7F6oD9jwoeiJFOVQTgmQWSSSb5KNrZ5FQ1AsKvoZ4egz9OBJyJlDSntN1H3Wl4/
         MdWXtm+plZG84vHFCB0k6eYjwHuLfWVIOzWXAe12P/YRt6oGyd3sdxI3porAirM/3FZL
         CkrpBM16SfXDZvHAoiuxFGJSkIW5Av3/lWd2/umEu4xZaEdHNb4bfSVIWqeqf1JqmhbO
         GJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406052; x=1764010852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=R+0Eh8qHLUV/Jj9Rdl3ZMlC0adMuqHV7WdEM9AX2z8Tj8e0sRnPsqbF4DiVqKWkGJv
         zC2zsNProilsJv4I95gOtrP8h59kowczVoOIkrnNpYTOVSC6NJZZI3dBByQ7AvXX0mtK
         hW8T7l8e5b//hAv85NizQjBxla+f4dJ4SEuO7qP/wmXQ/j/K7meJaSv5TR6+cWE/OJ4m
         YevFRO+I2sV/gxWmlnuRVwVDcrDVlC51toGPvUImgj+HJggFcyNI6Ix8SmOGTxe6cU2t
         ohOtwTKfk3u9MG3xiSqRUgJnv0mwSArPH+8mLw+XcISRA8HkLwykYlwg0uluqRHxPgBU
         MUIw==
X-Forwarded-Encrypted: i=1; AJvYcCVSX1xqzolR9W00hNsz5mQIHrpFXO13Tz1iCQgpG/xyN1lBIrc7oJVESGSjGZ0fyS+TUVIOLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLcS40m890nV7n0X6KK28vIlaTOqw3Ez+etnUBd2XlmoJel/KL
	5Tdxrytludi+Y3CWp31X2EYYaP+b4CJhiV/+jGPEODvFtCNzHLC7zgEJ
X-Gm-Gg: ASbGncsRU4VUsQ85ZBHXVIsfwagj04Gwm16tZRqIppv0KR0cw+pdNEtuP9G1JhEOz0J
	hgPcftJJN4gFVb+1KdFMKGwfBZuSmBycRMQTH5qAI/4NmmNT68IfvYYply3BA+FtbJV9mFN74CQ
	F3erKt1fTdQytHejxYjahnsST185K6JqcR96fCMGcx6QjbTXQ4bwZsonFjUztVL8BDXqXT1kSmb
	dcg14jyznUYuknV5kezMVfrQfcDKX+86aNlG+FHjptrro6BloXn22fFdlojXqnLHvQPkWLiESjD
	cIKeI+B8n70zcqjqXxipde9K+gVw3UdzXh1IMyS1WZe12NZoxjgvfhnwsk7T9PbTACSZveMw8sU
	pBGdWL0wPnLdJrrql5yjjoP4JF/Tf1xgw/iAA61FzhfSVJYxvM07u4rek13ZzrZFJtdgNPycm/m
	MrrjFpjDeeqgC0BlJxDSc1TG7To7YPW6DUjx/e28F31kO4
X-Google-Smtp-Source: AGHT+IGDVNZOalPoeGLRx0StV1WyF6OuSXplI/tFFH2YjaxRb6M+ZouwxCgXlyJ+r8uHMpC01NlQdg==
X-Received: by 2002:a17:903:198d:b0:298:2af7:8d26 with SMTP id d9443c01a7336-2986a76a26dmr169206325ad.54.1763406050080;
        Mon, 17 Nov 2025 11:00:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm146281525ad.21.2025.11.17.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:00:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 11:00:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <7a445358-ce9e-4180-99dd-1a771c8ffa98@roeck-us.net>
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
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

Applied to hwmon-next.

Note that I can not apply the devicetree patch (2/11), presumably since it depends
on the first patch of the series.

Guenter
