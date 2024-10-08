Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C12215F55
	for <asahi@lists.linux.dev>; Tue,  8 Oct 2024 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412732; cv=none; b=szFK5RaihRfqo5OmMa0JDcE02G6gdGrfrYC0P8pB5ireM4blezoCggGRoi2OmUSz7HrGTBNtsplbVwEG8Cp4s6wZuiFwIq75ZqJIuqPlSFo/ykbPDCjf5NZ4iaU/6E9xoZA+g9xsvwlfZDjB6CejW4Xv5lYFPcQgoqOL2XlSGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412732; c=relaxed/simple;
	bh=9gV7/0tGIQjLqh9Fx/jz8DaRmGCazj09za4CP/pU8js=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=alGWvrShSxJoTaAMb8BDV+gSgxOzz79H9A5Z59aLJubROD32D8RtNQByvNoCIJW4D7vNwy5zlWdjeZj6vngPMPe8I6l71kaMvcHRKadXgtGtVs8MN6DvXhDIcmrfHlP/568tiq98LRQpeQSBsXUbsG+erP7tlRtBErV4xD6+TGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EkduCgjo; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkduCgjo"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e08c75943cso5796690a91.3
        for <asahi@lists.linux.dev>; Tue, 08 Oct 2024 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412730; x=1729017530; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/7cUK46GwJQ6x4qnVErUSuR+LuA3HBRtEZoz9lIYWY=;
        b=EkduCgjoNZMqnESj4/bZPz1Dv2c6LYuhnuM4HdQeSxw+mjbF/kZKA7tNdOh1zOWauX
         3G8jED4+1VdMijjxHZYoA4e7Lv6JisqX2lasDW0R3BCXA60vmZq+Vs3xacLQw5vyxYXB
         P4iRLudYmPwFW4CZEsSGn6PA9DjKHpFlKJ7bnDRFj32p+Wx6UGCUMKaUDp7IR2wZFDSa
         NqD8jmqIr22HBlA5P4RY55hcBh7jIAg5S3HUtT96mGDV1/q2Dw0M2MiUA1hsnTL5xiYs
         KYPzNpxmnkXCbUdRo94rsD4Pt+7fdNaNsGOExQyfAF3E8GNzrg71szMQz4/rHgGm7eVw
         vAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412730; x=1729017530;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/7cUK46GwJQ6x4qnVErUSuR+LuA3HBRtEZoz9lIYWY=;
        b=hWyPebbCVYmm8jhMTK12vZjQYuYjt9AHLPNxnmIX9ipiNFE+PSGvAaGStReBrmM8rH
         44dlVWk2H9+WqKteBWz8AVntl6D21nqA6Xc7ZfwJmQYutgOr0WvXBVHcAmdg8nFyySzf
         szWcUXlRXoupxsZBrhjTfs5LlGLopW3Sg363t6OkAkL5SG/UZyZpr8O3aUXrZqrhy3El
         8It8jF8n1TxP3zHBCMv0aGLZQ/zk3YSlhAbZivA48GGPFmW4Fn3/jTwH+Wzc00qDAXcj
         R7vHz5KQbB+iLBEGUwJ9eORTXlwE6EU+WyhP9Xq37unwvYRIgnerWpG/AzQeeFaB6scH
         RQRw==
X-Forwarded-Encrypted: i=1; AJvYcCXbNTNudBNn19JtDfZV3M6vLTuZceSswEw4B2F1eTmYzNz7BMJxAPOA/IW/cjz6ZyzKzH05eA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa6UmQkD/daVsqBNO5zNM5AVQCLYtG0CtRkTL5lf+m5i55wN8U
	Mw27bDuJTJZyPcP29XhnIv8YiL8N+eSJ6V4p8KSN/+6RynoSBOc9dfgG46YbHRnGDwfraxpNvXc
	7M58qKtA/5dae+QeOeP876z3Rdg==
X-Google-Smtp-Source: AGHT+IE6LhNdR5oIpsAclCxTYj23wKJXRH88zQ4Is6y5tWPfBQ0Qtjn64WftOc8Vg35khcoJoJyWDcEjmUP+BUTj5jE=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:750:b0:2e0:b26c:9068 with
 SMTP id 98e67ed59e1d1-2e1e631af4cmr25866a91.4.1728412728856; Tue, 08 Oct 2024
 11:38:48 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:31 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5802; i=samitolvanen@google.com;
 h=from:subject; bh=9gV7/0tGIQjLqh9Fx/jz8DaRmGCazj09za4CP/pU8js=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNcoSvMe/39Vcwps63dC+evPSRc3T7yikJq3csGuh1
 82fj9/N7ihlYRDjYJAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATOfCXkeEqRx+v4WTbFPO4
 jS2GttOndRzO71j/7MP/C0zzj2Rte2PGyHCpeEuY67LXUTuVtF5vLp60pnhz6cMFzVICaw58TJ3 nlMYHAA==
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-28-samitolvanen@google.com>
Subject: [PATCH v4 07/19] gendwarfksyms: Expand subroutine_type
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 1d67ee18a388..7e6b477d7c12 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -211,6 +211,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -223,19 +232,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -255,6 +273,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -289,6 +341,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -359,8 +434,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -390,7 +468,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index f2be353c3b0b..f31bfcb0dfe7 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -63,6 +63,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -156,6 +157,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.0.rc0.187.ge670bccf7e-goog

