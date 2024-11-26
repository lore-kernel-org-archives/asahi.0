Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203B1DE2AA
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732646049; cv=none; b=fF++qpIAfkjPR8Ry1YuzYlnvpBwzfUvfIx5D0KWHrrkJKDAXtDNb8KjxhAUVrEeaF6cB1MD34ba6LxvRWPYDJJ80fDg6thjJpP0Zyf/uLliJuzP52idG3+RrVINFROjwqPnLOTbilXYn9vi96Rt6+vb3dMwE6bbeOa4Cya1SfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732646049; c=relaxed/simple;
	bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcXBG+IBMWDGFCMaEI4biJreigbvkNITPfOQmxrXvQ9x6EEAvGbh/A872Y71qL1lnxs/jvPa1vPhrdmytJxB7NAL0v8l3X0chkO47ltumkxbceytd0huMJIUxNpie3yIryOo3DBS/u04CgEN+uPLhrCJyWxIlC4ftAVtl/pjMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTnJCpiH; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTnJCpiH"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e382589e8fdso5807557276.0
        for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732646047; x=1733250847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
        b=bTnJCpiHN8HIFuPwWjrPeBGN7GYKZXy5NMirIcApjL4oGbGRUKUWPAFWt67PVdPs2e
         UcIf3WHwx5V48PnNooMWYkQYmULZBpNr6xxXol4H18d1KlK1ZVQdRzPtVqO4jpWARTBF
         DQIN34rkPgRqn2sGEs7YCMerfDaw2ipdHhj70I+1gPqepJJMXCDW+Jz4F5OBChVx90yJ
         EkUhnvtihWv4/wkRZXe4DnGZ+VWU2keDX7neT42uUKYJt0dfsXHpP46p1bNWdAevYYCO
         rypIZ/NqO+PYvOy4VVeNEPpqQTUCm51gIomQD15oF8gqBh0zhNBcEK7sR75w4RY4CmOR
         gq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732646047; x=1733250847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5ZdijXHGTf9/VBMxXk0sgaeGJSHANk1xhdrCGF3VVs=;
        b=YWyTGNhAdgkiCN1aIVchOhj0HTu6IHXRiErWi5GT0JrV9EP1Vksl6HLk4sXcNY9P/N
         FOsqnWzR3DDZ0cVjooU1zo3xK6KrtGdy+oHT9KxgjyYFSGG+xne1NBBKDMzNioqeu2MP
         ljqAzUpk9mFgqDIk33Ib5DEAv4+xqU3yV+vWQy13kFSGP6bVU31cuAeHERdPo29afjk3
         wBZe0P746lxNWfqhRQ4KOh8/p3VJxUkhZt2hdzFbtXMiEUy/b6dj/4P401auBqHWX1EB
         OxNIjG8ZmMGhkMQKBkKdmgOGVY8F9Do/Ek0UwO2ScWam4lrX0oTbH0uQOfziEFbcL9g0
         OzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQh32eicGULYNA9awmAn3hD99SxiPVBo6sraxQB4iMQ+Y0pv+I1lLFV2a5jbBi1XDOqQLIhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGAYg5ayIkJhWDvowIQa2TlLFJKpzwwsJS9zz4mtDf0bOxi/Ev
	cqPvvE8fprE9z6JRWbTCy9P+JF0ZwWI8eTSbiPcyIrWuR3u6jx6jdP70lCXLb0yngZJwyTwXTCf
	QjYsqJFBD/Rlveq+7l+kSJBD8OTE=
X-Gm-Gg: ASbGncs69dQ0kXtTFU8SpUe+gxvyv82Hdlik6tgtY7mxSiOqG5DYOrH3S8RuuEDoU9V
	YTnYmv6WPgGbr3vwEXjMGL4E41Wj3sV3q
X-Google-Smtp-Source: AGHT+IEAKAQZoBZRcCS59s6ATzOJRqSPoDhyFrhH0wpI4a7G9pyRjoqsbwGfh6mDJveSJ2gv3edzPDtBsyPh4VazY1Y=
X-Received: by 2002:a05:6902:2606:b0:e30:e9b8:abcc with SMTP id
 3f1490d57ef6-e395b973db9mr91652276.48.1732646047430; Tue, 26 Nov 2024
 10:34:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 19:33:56 +0100
Message-ID: <CAMT+MTRJrN1_LBm+Ba6wh1BcdG0co-AHY8t4rnLuLAV=75wZbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Please take a look how other bindings define ports. You miss here
> several items and more important - description what are these ports for.

Aside from missing descriptions, this definition is copied almost verbatim from
snps,dw-mipi-dsi.
Ack on the rest of the comments, those and the descriptions will be
fixed for v3.
