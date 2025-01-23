Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0FB212D9C
	for <asahi@lists.linux.dev>; Thu, 23 Jan 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646178; cv=none; b=nsYM0yJbpky+nozfdkJCA0VLcwuQiL+/kjWLNdTnlo4OVDzwrHvHhiYgSwuEX3RV9vYFoEePZHPGDe7s+OZtvzQSSj9EZcC8wXz5gZL9fmTz18evDjejQh4Ie0vXtvXGzsBlbjMtLGnTxwN25gCu3PApsisx35GpBUh1GkAsTr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646178; c=relaxed/simple;
	bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMkoR/DEOVae/x6thQYlaqxhd8uSxKRdg6QKVZOAM4OnytQz86SgRpfWj0ovlXEpgyyUuu7ZqsT3r3nX6mOm3sf4Yz46lCRaygnWcAtbRvsrIkLzWJW0adLj8wLATK1Iq+UFdxzC4/VgGB31lkVV1HureWwoclrCjHbRTZMXpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYLqKXs6; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYLqKXs6"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e39779a268bso1676793276.1
        for <asahi@lists.linux.dev>; Thu, 23 Jan 2025 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737646176; x=1738250976; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=CYLqKXs6hpbi33j2eoeGBw+bIAYl5/HfSV1Z9pg0p4CB/n6a6JgEUMZ6dEIV/ab/yE
         CGaGwQkDNNHX0nDJoJ5R15+WAm+IrfJUXyok6oNnsc9Q4FVHlyWgFY91rnYegFl28TSS
         snphwHa7Pss4Ot56wOkol0Gn34vSD/Vp8oAqHaJ0xG0osWONGMMBsBG0eEaEo2UzEULt
         PcTyomsxkaxX00CW55ciseM07ot0JL8etxBpmpT/Jck8IG2xgYsnj2BVH9Vote17W6rv
         5efDqngS/LvsMY/fwxu4sG9aTg084Qhk6yjyPmkyKo2D/BmeyJcpwOMra198hWabxOJZ
         8sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646176; x=1738250976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=S4QDr9R9vZOce8einAE6tq5k/VE7stM9yQLwLJfx3i/4jIavORfk0ZdhJLlWN5H8EY
         xRf+LHJJzpzOoyslOi0hDijfH018SmlvjNI3l/zliSRD7jJWlWVx7G73wYEVbmIcM9zF
         ZSmGTuvRitREPrF+ZQ4l9N44AlXOT8PlNkz+xCVlzdfPW46fsnDCx5mEiNGd9KpPKl2y
         kAL/2r0m7D+svN2e/t0P+gKuQ9z+0QzFZBZ/+NxnGYqRJKgJ1pV8Qmsca1bIdY+LvnuT
         js4r3qZdkdxh6Pop4ndNfDoIg6PW5i24NPGZf4Cnl1dQ2sQLiUZwjQdnP/xYc8l1OK85
         bZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUNhRBiCCwBxnM5BVMZ2txarvx3eUlnLEmmAMiLBQ+5fe2B2lTXff8xw9ExTUi/PJhCOgtbjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZUb3pNDsXAbqikUL0bI31oxD8jGtKbZr11Ip0lxJ5EP90z6xE
	tM2GJRbkHcaiFZGmqjOXEiAT1fERoAiQd7XxHNnKE8DQz3NLtvGaidbI54BJPGkSl2HtS/0ywyK
	vYxsT/WtyZDdsW317swQmP2U9kHk=
X-Gm-Gg: ASbGncsE7o7lFTto7eMxaCLe4OT47BEs73Fdvmu7k9sf4ya1r8591Acl0dEBMBg/Vfz
	VLomcPNuDG4fOQ/Q/AVL+zbIK/FcLE0535LGedWkgYBkFjRWNCN+PUswABYzt3P4=
X-Google-Smtp-Source: AGHT+IEcgaNEMT/nz9felDBiOOxXNv6kz7jxv8iPIixkQPXeXQj/Qcp8sEMC4T0kInZ7xTeKCClB4Fx7CAupT9sEVhs=
X-Received: by 2002:a05:6902:2a8d:b0:e38:9227:befa with SMTP id
 3f1490d57ef6-e5825780b02mr3125345276.1.1737646176006; Thu, 23 Jan 2025
 07:29:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 23 Jan 2025 16:29:25 +0100
X-Gm-Features: AbW1kvYrTQzvZ3DNs13coOwZ-EGWuTfhUMiTchLAOX9rz6NmJ2BSwg_pqYaH0XY
Message-ID: <CAMT+MTQudKdUs5we_UCqN0WPJn+T0pyY+NrbaBFKBM2Rkuacmg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
> index 4a5ea252961a..a1bd2f3147ab 100644

Since i will be incorporating this into my patch, do you want a co-developed-by?
