Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A03100C4
	for <asahi@lists.linux.dev>; Fri, 23 Jun 2023 17:20:07 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-bc615ca6ea6so1232627276.1
        for <asahi@lists.linux.dev>; Fri, 23 Jun 2023 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687540807; x=1690132807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiBfjxCccTZov20BHaxSn4dvBGrOpxH5Zg2fttHLmAo=;
        b=vUzaOM/RwOe0xTyvCYmg4F3fM36X8xQ+vBoknwuOrceehnrO+IAoECNY3QF0zL15Pm
         wjBaOjnRslplk2hdm41mQGiaKx/c78xfFrG2eWwxSkiYlVNgvPmTCC9h1V0o+vHxSkBV
         QkSFBASDYPTHBjvH7P1cc6AUJa7EvzBoRqlhmloDYh6ogDcpwW4yJaNpI0xVT0MONGAx
         Ms+lSmz9khKYdLg0O/jY0VJqNChW8WEskqxcqnUBVZZ9vilOt6Pt71UfFtVDTzq/JmeJ
         9jJL1Aepkk4ls9rRE1FB/oSeMG6u9a2wpNzQF4LJ0g9/5igrxuIiQK46Z4FwmOts+2yr
         9A+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540807; x=1690132807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiBfjxCccTZov20BHaxSn4dvBGrOpxH5Zg2fttHLmAo=;
        b=Et/SZiyM1Ci6PQZkeTsVmVuGTANbmV9njLfSyp7zUVFpaMmyOfSl+E7g7WJWMnikvp
         P3BrzXW9iyOmG5IX+VC97ZSjIjLYfwLNtrirYBUMIVdvpFGxztJ51nUUJdq7u9CTOW12
         atA8rYpN6a0afmOinuSGv6LPXS6abYDg1fkdImUKSmHL4AXk6NKD0gFbQotN9wjbgI04
         6VBoJymH9ueTEQQ468P3Re1rKZsW2R2pMWg9nMXLCGTonMHPxoVQ9HiYUnVrOUma/tKY
         vkM26ESB8EMaahp4JA8aKn96yiEmRMwJpyf6PtPZkXDH91s4nuGX/fMnXSBz0kXz0zAt
         oFNw==
X-Gm-Message-State: AC+VfDzR2mFDJ3nzmIzZHnCAiMs8KZhr0ufgzasK5rxD+U+yiD8Cc0Tf
	QUzxRzJhcqI7TWKZ1JsEajOKdAUXHZiSInENlDo=
X-Google-Smtp-Source: ACHHUZ6cx2qgz7NSb63VxtrtMtA+DX4GBzGLbc+XFKkQCOYrP1gWt/nU7fhRzAZr+PjlLvWSt+azGJTAyzUvIUmGB90=
X-Received: from mattgilbride.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2ac5])
 (user=mattgilbride job=sendgmr) by 2002:a25:e78a:0:b0:bc4:ef98:681c with SMTP
 id e132-20020a25e78a000000b00bc4ef98681cmr3959400ybh.13.1687540806990; Fri,
 23 Jun 2023 10:20:06 -0700 (PDT)
Date: Fri, 23 Jun 2023 17:20:05 +0000
In-Reply-To: <20230224-rust-xarray-v3-1-04305b1173a5@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230224-rust-xarray-v3-1-04305b1173a5@asahilina.net>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623172005.2432028-1-mattgilbride@google.com>
Subject: Re: [PATCH v3] rust: xarray: Add an abstraction for XArray
From: Matt Gilbride <mattgilbride@google.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Asahi Lina <lina@asahilina.net>, Alex Gaynor <alex.gaynor@gmail.com>, asahi@lists.linux.dev, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello Matthew,

Could you please take a look at this patch? We also need `XArray` for ongoing work in Android's binder driver.

Thanks very much,

Matt
