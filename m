Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132E1990BB
	for <asahi@lists.linux.dev>; Mon, 26 Aug 2024 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724694125; cv=none; b=W9FWIOgmDbzabDVnKlS2hl0hm/jL6dk1bNkroZCphwAi3Lpb2ketzWDuiJKK4AoTmL6V8W5trYSaSgSUEwhw0HeddQtF71HsDP2Mw3Qe1NECeCRvzmd/vUcCr4DmhUeqPX8P+/sNqLld6WNrN2tz6UCVFnWCkU6lAmw9OIduCFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724694125; c=relaxed/simple;
	bh=QuSLEspvauRYDRZz063fX415QSr6sTsEnReWnJYDXVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs0emDpw4h+9fXqGvb0X+XWAtrpXMHCaIxCa83ZOuRF7AxyWvZZgGP1yqvzGm3Li2GH6PpEXjF5cfWsg1nFPjSg913axQ6ikGevaESJbzvn7viPGjoS4362pXryAPERRAxdee5Wp7Vhji0cI8loI35k2mXa1mlPf9lbc91WIn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KJCwHG0c; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KJCwHG0c"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso5735327a12.1
        for <asahi@lists.linux.dev>; Mon, 26 Aug 2024 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724694121; x=1725298921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiCSnJD3HP198YRuwR9nlOg90E6QQ9s3+l37OIn7TdU=;
        b=KJCwHG0cPwQdeCpXOMavtPIvcTPTEhZ1ti5N3cw75v6XAJ9ppfoI0Dm+pGbYyEBHDp
         mxt8NLU+zEZtO2+DxkWwtOz2p0uZSVj+q3EOXkpQafwlLC0Rn2eWaHXcS0wuYlwi5YzU
         Uj0+wE3zvHylNxE1Ql7gl+s96dqSxpKjsHKb67JgAy9ehwSdeaxcCwoTfaQ+vO7nUI8N
         VCauDKPTLlqYZyFfyiz+66WCL0IkXmIFd9Zmllh2PMovnYK41Ihq8SkzT9U16dBno7lX
         M+3EwtppEQ/HFIdvZEBabdMrDW66GlAoPS5B7o3AElT3IkoUY3oMaoVtVp3YhIBQSPzf
         o1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694121; x=1725298921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiCSnJD3HP198YRuwR9nlOg90E6QQ9s3+l37OIn7TdU=;
        b=gXEFcJVAZDF4nYNHRsYRpxl9/0QQB1XhpdqP2mJjuZ0fx2xdXw/v2MzYoy62O/qMyW
         RKYy8PD/0YzLN6A7DiFEVpbBLMiWjR/Hq4Os6vRA4I0ipPvW1cLkUlltWLloSPz0M+Fq
         ha/KfmQFHkvLtFQEdJyHFJIJsSnHOXNPX2Y/1RpsHrX9eXsxTLUQ31YMrDtQ12+mdQ3u
         F8csVzxG2mA9eUS+NFQB3e01d7W1+XvrvvlxjgUoQxeJ1kpxEnDt1JxBwhtTrJq4Yif3
         YkuzKI5rKoohTWMziYz06bY+bN+zmWeV9zOmI7UwnDOVn4rYZ82biN1VBySF9IZcRIor
         jPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkc40EMYpc77Pd40r4OnuTZZXqBQmuGj1953HOa9nGXXCT2Hbg9gkARTFs27KJG1QFSOgCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaMjsxDfWa+0EUVnWXHVVfRxLj3EMb3OPh4yX2bQ1Q3CvgTLDc
	9AupLHWv+eGLdx2AQYqtpcavH7WNYgXU6qH4021Igln0dp1vYMT235v2J0veTJA=
X-Google-Smtp-Source: AGHT+IFr4go4JINnJLtcWs0BB1xC/SXPqe+y4XSFmlELq1W0LCxG/Dp4ZIa768YslVaqXV+TjwDVpA==
X-Received: by 2002:a05:6402:34c7:b0:5c0:ba90:6a9e with SMTP id 4fb4d7f45d1cf-5c0ba906ba4mr80529a12.38.1724694120916;
        Mon, 26 Aug 2024 10:42:00 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb213739sm9690a12.54.2024.08.26.10.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 10:42:00 -0700 (PDT)
Message-ID: <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
Date: Mon, 26 Aug 2024 19:41:59 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-22-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  kernel/module/Kconfig                 |   8 ++
>  scripts/Makefile                      |   1 +
>  scripts/gendwarfksyms/.gitignore      |   2 +
>  scripts/gendwarfksyms/Makefile        |   7 ++
>  scripts/gendwarfksyms/dwarf.c         |  87 +++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.c | 146 ++++++++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.h |  78 ++++++++++++++
>  7 files changed, 329 insertions(+)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
> 
> [...]
> +static int parse_options(int argc, const char **argv)
> +{
> +	for (int i = 1; i < argc; i++) {
> +		bool flag = false;
> +
> +		for (int j = 0; j < ARRAY_SIZE(options); j++) {
> +			if (strcmp(argv[i], options[j].arg))
> +				continue;
> +
> +			*options[j].flag = true;
> +
> +			if (options[j].param) {
> +				if (++i >= argc) {
> +					error("%s needs an argument",
> +					      options[j].arg);
> +					return -1;
> +				}
> +
> +				*options[j].param = argv[i];
> +			}
> +
> +			flag = true;
> +			break;
> +		}
> +
> +		if (!flag)
> +			object_files[object_count++] = argv[i];

I would rather add a check that this doesn't produce an out-of-bounds
access.

> [...]
> +int main(int argc, const char **argv)
> +{
> +	unsigned int n;
> +
> +	if (parse_options(argc, argv) < 0)
> +		return usage();
> +
> +	for (n = 0; n < object_count; n++) {
> +		Dwfl *dwfl;
> +		int fd;
> +
> +		fd = open(object_files[n], O_RDONLY);
> +		if (fd == -1) {
> +			error("open failed for '%s': %s", object_files[n],
> +			      strerror(errno));
> +			return -1;
> +		}
> +
> +		dwfl = dwfl_begin(&callbacks);
> +		if (!dwfl) {
> +			error("dwfl_begin failed for '%s': %s", object_files[n],
> +			      dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		if (!dwfl_report_offline(dwfl, object_files[n], object_files[n],
> +					 fd)) {
> +			error("dwfl_report_offline failed for '%s': %s",
> +			      object_files[n], dwarf_errmsg(-1));
> +			return -1;
> +		}
> +
> +		dwfl_report_end(dwfl, NULL, NULL);
> +
> +		if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> +			error("dwfl_getmodules failed for '%s'",
> +			      object_files[n]);
> +			return -1;
> +		}

I see that libdwfl has also directly function dwfl_nextcu(). Would it
make sense to use it to simplify the code?

> +
> +		dwfl_end(dwfl);
> +		close(fd);

Isn't fd consumed by dwfl_report_offline() on success? I'm seeing EBADF
from this close() call.

> +	}
> +
> +	return 0;
> +}

-- 
Thanks,
Petr
