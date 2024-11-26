Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F41D63CA
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638863; cv=none; b=QxlUfnoQOnUnYc3+w73Is+Zmz7k3tHOHPjfqHB4UHvCKc5UhSl40aGeATz3YCtrn1JisbzE4UwFK/B2Ig8aWSTbIv/Mrd0iVv6jAVEZVquaWQj21X17WVMacEwphCjj/v0ps984ZgFDFCyb5vex6SERCI7idrGNMjrXaMV9zZwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638863; c=relaxed/simple;
	bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0Hi5GO6+JudbHVRPQTFJLhJSpKruSpm0ZQBbDmeviGrCT8gEoVKSfH387OlEkSTQx5B7chtkpxaCyYWH1W4qAk8EuoVCvFERMRmkOL+kBRsfRCzEcJkk2un7VFCdudq5r29vfDwv+74CZNSZe8DUHxiHb1Yso5X/qQKuT0hJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZ4UeCA1; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ4UeCA1"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e388d853727so5304928276.1
        for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638861; x=1733243661; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
        b=VZ4UeCA1b7cq/QvEB9b+atiepe6BqPKOFlis+ZCV68Cz6r2/rcPW19wVZN1KyaFzkj
         nX4LU8a/SeZ2DfideNPfrwbFhffqnaCSRNSNlOHxXF4KRmoAAL3tZf5BC49XRdal5Vm0
         h6BNvSHss6Y0pKkjZND1I/7B03CJmnt0iUDhLlArxdfo1oMiZVCLiFHWHFEo2F1xfcv5
         wPtk2bhZN55C4S5UxfoNWSXYx1l+QcxE5k60J2JxMriBjxT3J2vbJkcn38By6NTkYFz8
         qkqK635dzg9PDIeYAGJT+FY7HQdJ8o8sKcQkJ3mLvIs77m0N5P9lXZTvjADxREN88ejB
         50GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638861; x=1733243661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
        b=BAsYJ7TkIz3YrhcAZ56/Yhx7vIyVRy6RB35Q1CKayXdrJIGsNjFHlQwr9OK8jHZHqF
         qoac8bPz0oIi3T/Iliaz3zlsN6TY8ylqAdO+DK7o7uvj1TgfFsaCbQQpLC46MaLsRzuf
         B+YHXFrTtn3VvHIWCMXm6CNM117GED/mdPEvbl92TX+L1FN7UU2EftyCTemFII75G7q6
         NO9RliLOdV9V2UMC+IhCj84UxvvKV1uePaHpC0gk3C4u51qg/M/Eqy2rYBa+vIIcbv50
         ikWdgGVUrgkhGk3i2WpGQz5zaNsi0NwCpn3XxGBqMljMmm/9Ir/emDZKzWexIREhTXe4
         7yPw==
X-Forwarded-Encrypted: i=1; AJvYcCVkObpVpmh/dy8aeqeldK560KyFD/1dY3ARtiKK9jL3QzgQIRiQvFzqz1pUhTz++XsMJKVGBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ+Iv2iT8hrgeOmlUn9A7G0LsAu64tdB48LPZGnSh81S8vGZNw
	2rvcjYqtV/4PYTnPStpysviLRSc7hydLuNsV9RKBaHFUaePiowmxRi5SJZ6L+2/YaNZ/GHvCsHM
	xFK+YAQfDV6WanK0CcRJUd2yAuxc=
X-Gm-Gg: ASbGnct6EPHcV5iafvj700xZV1BVZSzNi11JbDA38IqZqyFsHsAnbZelrkrU75/b+Qg
	PlTr/LBqNgSf818nNuevFgEAdFMfrOK0n
X-Google-Smtp-Source: AGHT+IH0rBw+xuH2VbnRPCa0ythGe+vmqwLZcKnDRV9jeUgWhfvMABxWAASqLF5EJD3NVkEYkOzdFIsrWd4Mu4/XXZw=
X-Received: by 2002:a05:6902:703:b0:e2b:d4c8:c5e9 with SMTP id
 3f1490d57ef6-e38f8ad708dmr15164230276.11.1732638860727; Tue, 26 Nov 2024
 08:34:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org> <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
 <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
In-Reply-To: <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 17:34:09 +0100
Message-ID: <CAMT+MTSetzODw-cbteQOgEYmEgpiFBVP5eDgjvyHGqofCU=VXg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit LCD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 16:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> BTW, max-brightness is a property of backlight, not panel, I think.
This is an oled panel, so no separate backlight device, the mipi commands
just change the pixel brightness. There is prior art in other bindings on having
the max-brightness property attached to the panel itself.
