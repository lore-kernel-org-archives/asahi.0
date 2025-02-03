Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE31FC7D7
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574273; cv=none; b=sxdhNXkdGgsNUvgFfTrTPPvhKWVI7GBO+nAmvHi6fMc6COHI9TF4PvJko35k1Yd2Ve7jiTkCsnyOOWubDcWZ52G/z+f2EVuLfRMf58rPqgHTI3iRcDp4Xzkfvc0W9iB2ByD4/gTjD+DOV/1aSOqYpiyAQ39i+2iUESnJ7iStxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574273; c=relaxed/simple;
	bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHrcYNxU0GXHQfI4l5zjoh/+bL6hHV+Q6wkUijFDuy3FGD0xHj2cT0IalHhmFj2OEI50rsnc2FAd+MbyclQogoxyV4xv8enOsLn9hwPQ8v/FTHfYcB7iKqtTflECmY0EQTwk0ITgm7xPJtvF916RPlv+pwtxK1genSCx+r5Wyo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IyIJx6j0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IyIJx6j0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43622267b2eso41673195e9.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738574268; x=1739179068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=IyIJx6j0loIMyWn2x85o2VHz7NdIUdaLQJ3z0KidQN1jrH0e3BoB+r9D4+OU+byz8E
         7TVWPHqiBX3iPDT7D5rorkavRLV4CfIPDc8lJjCB3qMrQaZnNTdNBPdiQX+SXTlhZeRF
         B0mvT0eDTB55Mhfj60zT8VkOoJ6c5P48h/tiZHyjH53ujL4CC/ZopxTS31qDEUM+s/+Q
         cMHWpaRMzXv8mznJF9ODCc6yIF+Vxhqgm1rgNgVkEdpZVl0vC67PO+JsYarEJQabUCzZ
         Ofm1IWbpGwYSAxbEhiy8fNZnZwIX9RoSU+lvV/2+l434m/tTW7TtGxp9T7azmumSIc4D
         nLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738574268; x=1739179068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZvdJoCzVjHsxT40ttPflNqCtnquMUzEPyDKK26T2pw=;
        b=U/l3mmMOiJLeTOvUMTvOQKcD5JZHgakwt+LCcVoqzUPtWaeZATVk4ARglfGKBiRcPj
         d3ml0OqDciRxB5O7E4O0u2Xvg6WsQPQEkqJPa6EH9AXxFgQfmME6TIAdnUinVxzJvgSJ
         nLQU3GR4CqzLl+UoDPePakrekWeAD8DE/yduETaHTRyKg5I4atLhzZfSH6LA8UQ9EbAa
         K5URPy4vjqJsx5O6xRuGsXOyqrRNNDSG2U3MC/RCH/RAg7HirxywD3FO6Dn2BHb0ymgy
         JYGh1wI7liSun+upmhzY/Zbcx0Knw0UttLT6ObAe9CvoncFe8nKy5Yi+5s5b1+pNsNfT
         EyRw==
X-Forwarded-Encrypted: i=1; AJvYcCVXKeIf2i0gI6JB2kBwOFCafQZA5ClE3r+n4K+lsgJN854snBeCtxQ8wGmvBvHT21eMGgoIqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoGhNbY8BFZml0qVSOFNtH4dY/NZzWe0qjS/6MdN9XULPSKT/C
	Rab3lliayD2v3/3maBK1eaIWEk8/nnBh+SFKMs270ZdfV+Ct3esMDoOGvRcoAuxgxT/PBiCf4ot
	Vf1sDjbzw6EQjBGr+27nkKgsi9aNb7E+xnGSl
X-Gm-Gg: ASbGncvhSzcTmbro/FyVwaycYsrYk3YmSd2raLG1PPdbo5quJtl3oH03a3GyQUQNnXV
	6mb6i9QzODn8yLynzSrJcFvnivuialEnnuV3fuOgE5Z3PeBMbPAYBytyhBnxHe3yNln7ulCyM+g
	FTLr7oWpATt5bg/k86BwBvuY0N
X-Google-Smtp-Source: AGHT+IFc/1AuykTGw2Qq96Tvv03ntnD9n7SFRLhjQXSqvolNCxvTm+SCCbwciWNaqMmYnD3m8ACiqaA8EI8pP0CLNkY=
X-Received: by 2002:a5d:6d86:0:b0:38a:873f:e31f with SMTP id
 ffacd0b85a97d-38c5194d20fmr16306574f8f.1.1738574268194; Mon, 03 Feb 2025
 01:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:17:36 +0100
X-Gm-Features: AWEUYZnHBKgHkqPgFSXj_rkUh31XGNKQXaliK-ukOAh1dOlV4j6E8lRPRejB3OE
Message-ID: <CAH5fLgieTeYJ_prMX7K6eS63ctDwT+NBYrzmOakbNGBjuXA0kA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: page: Convert to Ownable
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
